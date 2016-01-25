class KanjiUpdateJob
  def perform
    tweets = client.user_timeline(random_source)
    TweetImportService.process(tweets)
  end

  private

  def random_source
    Source.find_by_id(rand(0..Source.count))
  end

  def client
    @client ||= TwitterApi.client
  end
end
