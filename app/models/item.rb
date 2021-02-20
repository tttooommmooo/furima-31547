class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  

  validates :image, :name, :info, :price, :user_id, presence: true

  validates :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }

  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }
end
