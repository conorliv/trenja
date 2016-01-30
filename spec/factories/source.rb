FactoryGirl.define do
  factory :source do
    name { 'makoJOSIAH' }
    value_index { rand(10) }
    source_type 'twitter'
  end
end

