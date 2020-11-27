class UserPurchase 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :token, :price

  # ここにバリデーションの処理を書く
    # validates :addresses
    validates :prefecture_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    # orderテーブルに保存するもの
    order = Order.create(user_id: user_id, item_id: item_id)
    #adreessテーブルに保存するもの
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end  
