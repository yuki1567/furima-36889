FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              { 'abc123' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'リクタロウ' }
    birthday              {Faker::Date.birthday}
  end
end