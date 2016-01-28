class Kanji < ActiveRecord::Base
  class << self
    def top(n)
      Kanji.order('count desc').limit(n)
    end
  end
end

