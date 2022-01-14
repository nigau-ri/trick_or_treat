require 'rails_helper'

RSpec.describe RoomDetail, type: :model do
  before do
    @room_detail = FactoryBot.build(:room_detail)
  end

  describe 'ルーム詳細情報新規登録' do
    context '新規登録できるとき' do
      it '開催場所と開催日と人数とTrick_or_Treatと雰囲気が存在すれば登録できる' do
        expect(@room_detail).to be_valid
      end
      it '開催場所は空でも登録できる' do
        @room_detail.place = ""
        expect(@room_detail).to be_valid
      end
      it '開催日は空でも登録できる' do
        @room_detail.date = ""
        expect(@room_detail).to be_valid
      end
      it '人数は空でも登録できる' do
        @room_detail.number_of_people = ""
        expect(@room_detail).to be_valid
      end
      it '雰囲気は空でも登録できる' do
        @room_detail.atmosphere = ""
        expect(@room_detail).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'Trick_or_Treatが空では登録できない' do
        @room_detail.treat_id = ""
        @room_detail.valid?
        expect(@room_detail.errors.full_messages).to include("Trick or Treat の欄を入力してください")
      end
      it 'roomが空では登録できない' do
        @room_detail.room = nil
        @room_detail.valid?
        expect(@room_detail.errors.full_messages).to include("Roomを入力してください")
      end
    end
  end
end
