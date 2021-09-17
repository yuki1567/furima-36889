FactoryBot.define do
  factory :order_address do
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 1, to: 47) }
    municipality   { Faker::Address.city }
    street_address { Faker::Address.street_address }
    detail_address { Faker::Address.building_number }
    telephone      { Faker::Number.leading_zero_number(digits: 11) }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
