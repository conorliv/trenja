class KanjiController < ApplicationController)
  def index
    @kanji = Kanji.all.sort_by { |kanji| kanji.count }.reverse
  end

  def update_counts
    source = get_random_source
    tweets = TwitterAPIClient.get_tweets(source)
    percentage_kanji = Kanji.process_tweets(tweets)

    if percentage_kanji < 10
      source.value_index -= 1
      source.save
    end
  end

  def update_sources
    sources = TwitterAPIClient.get_friends(get_random_source.name)
    Source.process_sources(sources)
  end

  private

  def get_random_source
    Source.find_by_id(rand(0..Source.count))
  end
end
