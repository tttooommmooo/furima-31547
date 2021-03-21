class OrderAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :city, :addresses, :token, :user, :item
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A[0-9]{1,11}\z/, message: "Input only number" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  

  def save
    # 購入情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user, item_id: item)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number,order_id: order.id)
  end
end