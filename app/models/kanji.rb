class Kanji < ActiveRecord::Base
  class << self
    CENSOR = ["気違い", "おっぱい", "くそ", "糞",
              "小便", "スポット", "女性器", "フェラチオ",
              "性交", "間抜け", "チンコ", "たまたま", "オチンチン",
              "ちんこ", "おまんこ", "乳房", "チョン", "黒んぼ"]
    # Tweets should be an array of strings where the strings are tweets.
    def process_tweets(tweets)
      # If I decide to censor the tweets, I should do it here

      counts = Hash.new(0)
      tweets.each do |tweet|
        tweet.split(//).each do |char|
          # The UTF-8 character range that contains all kanji
          counts[char] += 1 if /^[\u4e00-\u9faf]+$/.match(char)
        end
      end

      new_kanji_data = []
      counts.each do |kanji, count|
        new_kanji_data << Kanji.new(kanji: kanji, count: count)
      end

      Kanji.import(new_kanji_data)
    end
  end
end
