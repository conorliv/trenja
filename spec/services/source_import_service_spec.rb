require 'rails_helper'

describe SourceImportService do
  describe '#import' do
    let(:source_1) { 'FakeSource' }
    let(:source_2) { 'FakeSource2' }
    let(:sources) { [source_1, source_2] }

    it 'loads sources into DB' do
      SourceImportService.import(sources)

      expect(Source.count).to eq 2
      expect(Source.first.name).to eq source_1
    end
  end
end
