FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    association :item
  end
end
