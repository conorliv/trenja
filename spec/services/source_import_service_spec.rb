require 'rails_helper'

describe SourceImportService do
  describe '#import' do
    let(:source_1) { double('FakeSource', screen_name: 'Fake1')  }
    let(:source_2) { double('FakeSource2', screen_name: 'Fake2') }
    let(:sources) { [source_1, source_2] }

    it 'loads sources into DB' do
      SourceImportService.import(sources)

      expect(Source.count).to eq 2
      expect(Source.first.name).to eq source_1.screen_name
    end
  end
end
