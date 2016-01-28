FactoryGirl.define do
  factory :kanji do
    sequence(:kanji) { |k| "車#{k}" }
    count { rand(100) }
  end
end
