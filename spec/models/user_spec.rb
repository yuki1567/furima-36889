require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, kana_last_name, kana_first_name, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合の6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'last_name, first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '山田'
        @user.first_name = 'りくタロー'
        expect(@user).to be_valid
      end
      it 'kana_last_name, kana_first_nameが全角（カタカナ）であれば登録できる' do
        @user.kana_last_name = 'ヤマダ'
        @user.kana_first_name = 'リクタロー'
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors).to be_added(:nickname, :blank)
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors).to be_added(:email, :blank)
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors).to be_of_kind(:email, :taken)
      end
      it 'emailは@なしでは登録できない' do
        @user.email = 'acom'
        @user.valid?
        expect(@user.errors).to be_of_kind(:email, :invalid)
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors).to be_added(:password, :blank)
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors).to be_of_kind(:password, :too_short)
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors).to be_of_kind(:password, :invalid)
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors).to be_of_kind(:password, :invalid)
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors).to be_of_kind(:password_confirmation, :confirmation)
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors).to be_added(:last_name, :blank)
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors).to be_of_kind(:last_name, :invalid)
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors).to be_added(:first_name, :blank)
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors).to be_of_kind(:first_name, :invalid)
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors).to be_added(:kana_last_name, :blank)
      end
      it 'kana_last_nameが全角（カタカナ）以外では登録できない' do
        @user.kana_last_name = '山田'
        @user.valid?
        expect(@user.errors).to be_of_kind(:kana_last_name, :invalid)
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors).to be_added(:kana_first_name, :blank)
      end
      it 'kana_first_nameが全角（カタカナ）以外では登録できない' do
        @user.kana_first_name = '陸太郎'
        @user.valid?
        expect(@user.errors).to be_of_kind(:kana_first_name, :invalid)
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors).to be_added(:birthday, :blank)
      end
    end
  end
end
