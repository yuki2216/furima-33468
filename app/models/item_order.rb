class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :prefecture,:postal_code, :shipping_user_id, :city, :address, :building, :phone_number

  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters." }
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number_id: phone_number, order_id: order.id)
  end
end