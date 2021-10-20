class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :street_address, :detail_address, :telephone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が無効です。例のように入力してください（例：123-4567）' }
    validates :prefecture_id
    validates :municipality
    validates :street_address
    validates :telephone, length: { minimum: 10, maximum: 11, message: 'が短いです' },
                          format: { with: /\A[0-9]+\z/, message: 'が無効です。半角数字のみで入力してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                   street_address: street_address, detail_address: detail_address, telephone: telephone, order_id: order.id)
  end
end
