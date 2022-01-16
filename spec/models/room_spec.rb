require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room, create_user_id: @user.id)
  end

  describe 'ルーム新規登録' do
    context '新規登録できるとき' do
      it 'ルーム名が存在すれば登録できる' do
        expect(@room).to be_valid
      end
      it 'ルーム名は空でも登録できる' do
        @room.name = ''
        expect(@room).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'create_userが空では登録できない' do
        @room.create_user_id = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('Create userを入力してください')
      end
    end
  end
end
