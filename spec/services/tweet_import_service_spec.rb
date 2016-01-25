require 'rails_helper'

describe TweetImportService do
  let(:tweet_1) { double('MockTweet', text: '車') }
  let(:tweet_2) { double('MockTweet', text: '車輪が回る') }
  let(:tweets)  { [tweet_1, tweet_2] }

  describe '#process' do

    context 'receive valid tweets from Twitter' do
      let(:expected_result) { { '車' => 2, '輪' => 1, '回' => 1 } }

      it 'properly counts tweets' do
        expect(TweetImportService.process(tweets)).to eq expected_result
      end
    end
  end

end
