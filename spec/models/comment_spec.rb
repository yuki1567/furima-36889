require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it 'itemに紐付いていればコメント投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できない場合' do
      it  'itemが紐付いていないとコメント投稿できない' do
        @comment.item = nil 
        @comment.valid?
        expect(@comment.errors).to be_added(:item, :blank)
      end
    end
  end
end
