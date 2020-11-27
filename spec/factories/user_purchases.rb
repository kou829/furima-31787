FactoryBot.define do
  factory :user_purchase do
    user_id       {1}
    item_id       {1}
    postal_code   {"123-4567"}
    prefecture_id {2}
    city          {"市町村"}
    addresses      {"何丁目番地"}
    building      {"建物"}
    phone_number  {"01234567890"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end