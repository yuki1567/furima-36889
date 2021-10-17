class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :images, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: 'は￥300円〜￥9,999,999円の間で入力してください' },
                    numericality: { message: 'が無効です。半角数字で入力してください' }
end
