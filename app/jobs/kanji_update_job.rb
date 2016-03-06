class KanjiUpdateJob
  def perform
    random_source = Source.random_source.name
    puts "KANJI UPDATE JOB: Using #{random_source} as a random source."
    tweets = TwitterApi.client.user_timeline(random_source)
    puts "KANJI UPDATE JOB: Retrieved #{tweets.count} tweets from #{random_source}."
    TweetImportService.import(tweets)
  end
end
