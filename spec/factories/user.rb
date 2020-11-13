FactoryBot.define do 
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"吉本"}
    first_name_kana       {"ヨシモト"}
    family_name           {"健太"}
    family_name_kana      {"ケンタ"}
    birthday              {Faker::Date.backward}
  end
 end
