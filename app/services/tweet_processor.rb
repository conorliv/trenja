class TweetProcessor
  class << self
    # Tweets should be an array of strings where the strings are tweets.
    # Return the percentage of characters that were kanji.
    def process(tweets)
      character_count = 0
      kanji_count = 0

      kanji_counts = Hash.new(0)
      tweets.each do |tweet|
        tweet.split(//).each do |char|
          # The UTF-8 character range that contains all kanji
          if /^[\u4e00-\u9faf]+$/.match(char)
            kanji_counts[char] += 1
            kanji_count += 1
          end

          character_count += 1
        end
      end

      import(kanji_counts)

      (kanji_count.to_f / character_count) * 100
    end

    def import(kanji_counts)
      new_kanji_data =
        kanji_counts.map { |kanji, count| Kanji.new(kanji: kanji, count: count) }

      Kanji.import(new_kanji_data)
    end
  end
end
