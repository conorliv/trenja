# Represents a potential source for finding new content that contains kanji.
class Source < ActiveRecord::Base
  class << self
    def process_sources(sources)
      new_source_data = []
      sources.each do |source|
        new_source_data << Source.new(name: source, value_index: 5, source_type: 'twitter')
      end

      Source.import(new_source_data)
    end
  end
end
