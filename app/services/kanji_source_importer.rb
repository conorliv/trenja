# Represents a potential source for finding new content that contains kanji.
class KanjiSourceImporter
  class << self
    def import(sources)
      new_source_data =
        sources.map { |source| Source.new(name: source, value_index: 5, source_type: 'twitter') }

      Source.import(new_source_data)
    end
  end
end
