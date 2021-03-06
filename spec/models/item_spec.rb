require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'images, name, content, category_id, status_id, shipping_charge_id, prefecture_id, shipping_day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300~9999999の間で半角数値あれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imagesが空では出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors).to be_added(:images, :blank)
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors).to be_added(:name, :blank)
      end
      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors).to be_added(:content, :blank)
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors).to be_added(:category_id, :blank)
      end
      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors).to be_added(:status_id, :blank)
      end
      it 'shipping_charge_idが空では出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors).to be_added(:shipping_charge_id, :blank)
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors).to be_added(:prefecture_id, :blank)
      end
      it 'shipping_day_idが空では出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors).to be_added(:shipping_day_id, :blank)
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors).to be_added(:price, :blank)
      end
      it 'priceが300~9_999_999以外では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors[:price]).to include('は￥300円〜￥9,999,999円の間で入力してください')
      end
      it 'priceが299円以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors[:price]).to include('は￥300円〜￥9,999,999円の間で入力してください')
      end
      it 'priceが10_000_000円以上では出品できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors[:price]).to include('は￥300円〜￥9,999,999円の間で入力してください')
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors[:price]).to include('は￥300円〜￥9,999,999円の間で入力してください')
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors).to be_added(:user, :blank)
      end
    end
  end
end
