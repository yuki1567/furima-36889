class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" },
  numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to:9999999, message: " is out of setting range"}  

end
