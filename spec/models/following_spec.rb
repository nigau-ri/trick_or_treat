require 'rails_helper'

RSpec.describe Following, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @following = FactoryBot.build(:following, following_id: @user.id)
  end

  describe 'フォローユーザー新規登録' do
    context '新規登録できるとき' do
      it 'フォローされるユーザーが存在すれば登録できる' do
        expect(@following).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'フォローされるユーザーが空では登録できない' do
        @following.following_id = ''
        @following.valid?
        expect(@following.errors.full_messages).to include('Followingを入力してください')
      end
      it 'userが空では登録できない' do
        @following.user = nil
        @following.valid?
        expect(@following.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
