class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one :order

  validates :image, :name, :info, :price, presence: true

  validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1, message:"Select"}
  
 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price, numericality: { only_integer: true, message:"Half-width number" }
end
