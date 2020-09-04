require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'ユーザープロフィール登録' do
    context 'プロフィール登録がうまく行く時' do
      it '全ての項目が埋まっている時'do
        expect(@profile).to be_valid
      end
    end

    context 'ユーザプロフィール登録できない時'do
      it 'age_idが１だと登録できない' do
        @profile.age_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Age must be other than 1")
      end

      it 'category_idが１だと登録できない' do
        @profile.profession_id = 1
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Profession must be other than 1")
      end
    end
  end
end
