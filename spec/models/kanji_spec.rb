require 'rails_helper'

describe Kanji do
  describe '#top' do
    let(:top_kanji) { '車' }

    context 'there are less than 10 kanji in table' do
      it 'returns top kanji at the beginning of the list' do
        FactoryGirl.create(:kanji, kanji: top_kanji, count: 10)
        FactoryGirl.create(:kanji, kanji: '今', count: 5)

        result = Kanji.top(10)
        expect(result.count).to eq 2
        expect(result.first.kanji).to eq top_kanji
      end
    end

    context 'there are no kanji in table' do
      it 'returns an empty array' do
        result = Kanji.top(10)
        expect(result.count).to eq 0
        expect(result).to eq []
      end
    end

    context 'there are more than n kanji in the table' do
      let(:third_place_kanji) { '馬' }
      it 'should only return top n kanji' do
        FactoryGirl.create(:kanji, kanji: top_kanji, count: 10)
        FactoryGirl.create(:kanji, kanji: '今', count: 5)
        FactoryGirl.create(:kanji, kanji: third_place_kanji, count: 4)
        FactoryGirl.create(:kanji, kanji: '日', count: 3)

        result = Kanji.top(3)
        expect(result.count).to eq 3
        expect(result.last.kanji).to eq third_place_kanji
      end
    end

  end
end

