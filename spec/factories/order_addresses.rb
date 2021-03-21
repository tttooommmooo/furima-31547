FactoryBot.define do
  factory :order_address do
    user { 1 }
    item { 1 }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '福岡市中央区' }
    addresses { '天神' }
    building { 'ビル1-1' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
