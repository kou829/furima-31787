class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sales_status
    belongs_to :shipping_fee_status
    belongs_to :prefecture
    belongs_to :schecluled_delivery
  
  
  validates_inclusion_of :price, in: 300..9999999
  with_options presence: true do
    validates :name
    validates :info
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :schecluled_delivery_id
    end
    validates :price, numericality: { only_integer: true }
    validates :user
    validates :image
  end
end
