class OrderAddress
  include ActiveModel::Model
  attar_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :street_address, :detail_address, :telephone, :order_id
end