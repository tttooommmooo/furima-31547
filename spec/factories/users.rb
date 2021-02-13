FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    last_name {'フリマ'}
    first_name {'太郎'}
    last_name_kana {'フリマ'}
    first_name_kana {'タロウ'}
    birth_date {'2000/01/01'}}
  end
end