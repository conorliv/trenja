class Source < ActiveRecord::Base
  class << self
    def random_source
      offset = rand(Source.count)
      Source.offset(offset).first
    end
  end
end
