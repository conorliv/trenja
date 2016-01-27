class KanjiUpdateJob
  def perform
    random_source = RandomSourceRetrievalService.random_source
    tweets = TwitterApi.client.user_timeline(random_source)
    TweetImportService.import(tweets)
  end
end
