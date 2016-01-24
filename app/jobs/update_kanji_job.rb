class UpdateKanjiJob
  def perform
    tweets = client.user_timeline(random_source)
    percentage_kanji = TweetProcessor.process(tweets)

    if percentage_kanji < 10
      source.value_index -= 1
      source.save
    end
  end

  private

  def client
    @client ||= TwitterApi.client
  end
end
