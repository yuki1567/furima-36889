class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :street_address, :detail_address, :telephone, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id
    validates :municipality
    validates :street_address
    validates :telephone, length: { minimum: 10, maximum: 11, message: "is too short" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number"}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, detail_address: detail_address, telephone: telephone, order_id: order.id)
  end
end