require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe 'カードの登録' do
    context 'カードの登録ができる場合' do
      it 'card_tokenが存在すれば登録できる' do
        expect(@card).to be_valid
      end
    end
    context 'カードの登録ができない場合' do
      it 'card_tokenが空では購入できない' do
        @card.card_token = ''
        @card.valid?
        expect(@card.errors).to be_added(:card_token, :blank)
      end
      it 'userが紐付いていないと登録できない' do
        @card.user = nil
        @card.valid?
        expect(@card.errors).to be_added(:user, :blank)
      end
    end
  end
end
