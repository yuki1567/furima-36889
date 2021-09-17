require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'postal_code, prefecture_id, municipality, street_address, telephone, tokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'detail_addressは空でも購入できる' do
        @order_address.detail_address = ""
        expect(@order_address).to be_valid
      end
      it 'postal_codeが３桁ハイフン４桁の半角文字列であれば購入できる' do
        @order_address.postal_code = "123-4567"
        expect(@order_address).to be_valid
      end
      it 'telephoneが10桁以上11桁以内の半角数値であれば購入できる' do
        @order_address.telephone = "0901234567"
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが３桁ハイフン４桁以外では購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが半角文字列以外では購入できない' do
        @order_address.postal_code = "あああああああ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @order_address.street_address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空では購入できない' do
        @order_address.telephone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが半角数値以外では購入できない' do
        @order_address.telephone = "abcdefghijk"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'telephoneが9桁以下では購入できない' do
        @order_address.telephone = "090123456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is too short")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
