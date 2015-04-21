class Kanji < ActiveRecord::Base
  class << self
    CENSOR = ["気違い", "おっぱい", "くそ", "糞",
              "小便", "スポット", "女性器", "フェラチオ",
              "性交", "間抜け", "チンコ", "たまたま", "オチンチン",
              "ちんこ", "おまんこ", "乳房", "チョン", "黒んぼ"]
    # Tweets should be an array of strings where the strings are tweets.
    # Return the percentage of characters that were kanji.
    def process_tweets(tweets)
      # If I decide to censor the tweets, I should do it here

      character_count = 0
      kanji_count = 0

      counts = Hash.new(0)
      tweets.each do |tweet|
        tweet.split(//).each do |char|
          # The UTF-8 character range that contains all kanji
          if /^[\u4e00-\u9faf]+$/.match(char)
            counts[char] += 1
            kanji_count += 1
          end

          character_count += 1
        end
      end

      new_kanji_data = []
      counts.each do |kanji, count|
        new_kanji_data << Kanji.new(kanji: kanji, count: count)
      end

      Kanji.import(new_kanji_data)

      (kanji_count.to_f / character_count) * 100
    end
  end
end
