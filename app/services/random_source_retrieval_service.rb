class RandomSourceRetrievalService
  class << self
    def random_source
      Source.find_by_id(rand(0..Source.count))
    end
  end
end

