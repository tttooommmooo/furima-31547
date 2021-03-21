FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    last_name {'フリマ'}
    first_name {'太郎'}
    last_name_kana {'フリマ'}
    first_name_kana {'タロウ'}
    birth_date {'2000/01/01'}
    id {1}
  end
end