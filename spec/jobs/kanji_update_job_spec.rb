require 'rails_helper'

describe KanjiUpdateJob do
  let(:kanji_update_job) { KanjiUpdateJob.new }

  describe '#perform' do
    it 'imports kanji into database' do
      FactoryGirl.create(:source)
      VCR.use_cassette('user_timeline_retrieval') do
        kanji_update_job.perform
      end
    end
  end
end
