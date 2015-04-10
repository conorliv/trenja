class TwitterAPIClient
  class << self
    MAX_TWEET_REQUEST = 200

    # Uses Twitter's API to retrieve a specified number of public posts from a users timeline.
    # Specifically, /1.1/statuses/user_timeline.json returns a list of public Tweets from the
    # specified account.
    def get_tweets(screen_name, how_many_tweets = MAX_TWEET_REQUEST)
      query = URI.encode_www_form(screen_name: screen_name, count: how_many_tweets)
      address = URI("https://api.twitter.com/1.1/statuses/user_timeline.json?#{query}")
      request = Net::HTTP::Get.new(address.request_uri)

      # Set up HTTP.
      http = Net::HTTP.new(address.host, address.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      #Credentials so that Twitter's servers can verify my identification.
      consumer_key = OAuth::Consumer.new(Rails.application.secrets.twitter_api_key,
                                         Rails.application.secrets.twitter_api_secret)
      access_token = OAuth::Token.new(Rails.application.secrets.twitter_access_token,
                                      Rails.application.secrets.twitter_access_token_secret)

      # Issue the request.
      request.oauth!(http, consumer_key, access_token)
      http.start
      response = http.request(request)

      tweets = []
      if response.code == '200'
        JSON.parse(response.body).each { |tweet| tweets << tweet['text'] }
      else
        puts response.code
      end

      tweets
    end
  end
end

