require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @good = FactoryBot.build(:good)
  end

  describe 'いいね新規登録' do
    context '新規登録できるとき' do
      it 'いいねのコメントの内容が存在すれば登録できる' do
        expect(@good).to be_valid
      end
      it 'いいねのコメントの内容が空でも登録できる' do
        @good.text = ''
        expect(@good).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'userが空では登録できない' do
        @good.user = nil
        @good.valid?
        expect(@good.errors.full_messages).to include('Userを入力してください')
      end
      it 'userが空では登録できない' do
        @good.room = nil
        @good.valid?
        expect(@good.errors.full_messages).to include('Roomを入力してください')
      end
    end
  end
end
