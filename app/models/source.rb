# Represents a potential source for finding new content that contains kanji.
class Source
  class << self
    def process_tweets(tweets)
      #Extracts other screen_names to search by
      usernames = []
      tweets.each { |tweet| usernames << tweet.scan(/@[a-zA-Z0-9_]+/) }
      usernames.flatten!
      usernames.uniq!

      #strips off trailing white space and leading "@" from username
      usernames.each do |username|
        username.gsub!("@", "")
        username.rstrip!
      end

      # Eventually I'll want to persist the usernames
    end
  end
end
