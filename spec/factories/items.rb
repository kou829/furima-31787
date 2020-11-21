FactoryBot.define do
  factory :item do
    name                   {"ケチャップ"}
    info                   {"赤い"}
    category_id            {2}
    sales_status_id        {2}
    shipping_fee_status_id {2}
    prefecture_id          {2}
    schecluled_delivery_id {2}
    price                  {10000}
    association :user
  end
end