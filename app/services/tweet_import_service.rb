class TweetImportService
  class << self
    def process(tweets)
      kanji_counts = Hash.new(0)

      tweets.each do |tweet|
        tweet.text.split(//).each do |char|
          # The UTF-8 character range that contains all kanji
          kanji_counts[char] += 1 if /^[\u4e00-\u9faf]+$/.match(char)
        end
      end

      kanji_counts
    end

    def import(tweets)
      kanji_counts = process(tweets)
      new_kanji_data = kanji_counts.map { |kanji, count| Kanji.new(kanji: kanji, count: count) }
      Kanji.import(new_kanji_data)
    end
  end
end
