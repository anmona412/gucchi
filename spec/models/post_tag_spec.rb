require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @posts_tag = FactoryBot.build(:posts_tag)
  end

  describe '投稿' do
    context '投稿がうまく行く時' do
      it '全ての項目が埋まっている時'do
        expect(@posts_tag).to be_valid
      end
      it 'タグのみがない時' do
        @posts_tag.name = nil
        expect(@posts_tag).to be_valid
      end
    end

    context '投稿できない時'do
      it 'commentが空だと投稿できない' do
        @posts_tag.comment = nil
        @posts_tag.valid?
        expect(@posts_tag.errors.full_messages).to include("Comment can't be blank")
      end
      it 'categoryが１だと投稿できない。' do
        @posts_tag.category_id = 1
        @posts_tag.valid?
        expect(@posts_tag.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end
