require 'rails_helper'

RSpec.describe FollowingTag, type: :model do
  before do
    @following_tag = FactoryBot.build(:following_tag)
  end

  describe 'フォロータグ新規登録' do
    context '新規登録できるとき' do
      it '内容が存在すれば登録できる' do
        expect(@following_tag).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '内容が空では登録できない' do
        @following_tag.name = ''
        @following_tag.valid?
        expect(@following_tag.errors.full_messages).to include('タグの内容を入力してください')
      end
      it '既に登録されているタグ名では登録できない' do
        another_tag = FactoryBot.create(:following_tag)
        @following_tag.name = another_tag.name
        @following_tag.valid?
        expect(@following_tag.errors.full_messages).to include('タグの内容はすでに存在します')
      end
    end
  end
end
