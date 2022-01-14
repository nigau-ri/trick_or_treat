require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ新規登録' do
    context '新規登録できるとき' do
      it '内容が存在すれば登録できる' do
        expect(@message).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '内容が空では登録できない' do
        @message.text = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Textを入力してください")
      end
      it 'userが空では登録できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Userを入力してください")
      end
      it 'roomが空では登録できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Roomを入力してください")
      end
    end
  end
end
