class KanjiController < ApplicationController
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
    Source.find_by_id(Source.count)
  end

  #def write(counts, sentences)
  #  counts.each do |kanji,count|
  #    candidates = []
  #    #Go through the sentences array
  #    sentences.each do |sentence|
  #      candidates << sentence if sentence.include?(kanji)
  #    end

  #    #Sort the collected sentences by length.
  #    candidates.sort{ |a,b| a.length <=> b.length }
  #    three_longest = []
  #    candidates[0..2].each do |element|
  #      three_longest << element
  #    end

  #    three_longest.each do |sentence|
  #     kanji_made_bold = sentence.gsub(kanji,"<strong>#{kanji}</strong>")
  #     username_removed = kanji_made_bold.gsub(/@[a-zA-Z0-9_]+/,'')
  #     url_removed = username_removed.gsub(/http:[a-zA-Z0-9\/\.]*/,'')
  #    end
  #  end
  #end
end
