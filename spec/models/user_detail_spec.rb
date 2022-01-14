require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  before do
    @user_detail = FactoryBot.build(:user_detail)
  end

  describe 'ユーザー詳細情報新規登録' do
    context '新規登録できるとき' do
      it '年齢と性別と都道府県と市町村と趣味が存在すれば登録できる' do
        expect(@user_detail).to be_valid
      end
      it '年齢は空でも登録できる' do
        @user_detail.age = ""
        expect(@user_detail).to be_valid
      end
      it '都道府県は空でも登録できる' do
        @user_detail.prefecture_id = ""
        expect(@user_detail).to be_valid
      end
      it '市町村は空でも登録できる' do
        @user_detail.city = ""
        expect(@user_detail).to be_valid
      end
      it '趣味は空でも登録できる' do
        @user_detail.hobby = ""
        expect(@user_detail).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '性別が空では登録できない' do
        @user_detail.gender_id = ""
        @user_detail.valid?
        expect(@user_detail.errors.full_messages).to include("性別を入力してください")
      end
      it 'userが空では登録できない' do
        @user_detail.user = nil
        @user_detail.valid?
        expect(@user_detail.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
