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

  def random_source
    Source.find_by_id(rand(0..Source.count))
  end

  def client
    @client ||= TwitterApi.client
  end
end
