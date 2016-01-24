class KanjiController < ApplicationController

  def index
    @kanji = Kanji.all.sort_by { |kanji| kanji.count }.reverse
  end

  def update_counts
    tweets = Twitter.new.client.user_timeline(random_source)
    percentage_kanji = TweetProcessor.process(tweets)

    if percentage_kanji < 10
      source.value_index -= 1
      source.save
    end
  end

  def update_sources
    sources = Twitter.new.client.friends(random_source.name)
    KanjiSourceImporter.import(sources)
  end

  private

  def random_source
    Source.find_by_id(rand(0..Source.count))
  end
end
