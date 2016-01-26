require 'rails_helper'

describe RandomSourceRetrievalService do
  describe '#random_source' do
    let(:random_source_name) { 'FakeRandomSource' }

    it 'returns only source available' do
      Source.create(name: random_source_name, value_index: 5, source_type: 'FakeSource')
      expect(RandomSourceRetrievalService.random_source.name).to eq random_source_name
    end
  end
end
