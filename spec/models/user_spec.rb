# coding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { FactoryBot.create(:user) }
  
  describe '登録確認' do
    context 'nameとpasseowdが' do
      it '正しい時登録成功' do
        expect(user1).to be_valid
      end
    end
  end
    
  describe 'バリデーション確認' do
    context 'nameが' do
      it '空の時登録失敗' do
        user1.name = nil
        expect(user1).not_to be_valid
      end
      it '6未満の時登録失敗' do
        user1.name = Faker::Lorem.characters(5)
        expect(user1).not_to be_valid 
      end
      it '65以上の時登録失敗' do
        user1.name = Faker::Lorem.characters(65)
        expect(user1).not_to be_valid
      end
      it '6以上64以下の時登録成功' do
      user1.name = Faker::Lorem.characters(rand(6..64))
      expect(user1).to be_valid
      end
    end

    context 'passwordが' do
      it '空の時登録失敗' do
        user1.password = nil      
        expect(user1).not_to be_valid
      end
      it '6未満の時登録失敗' do
        user1.password = Faker::Lorem.characters(5)
        expect(user1).not_to be_valid 
      end
      it '256以上の時登録失敗' do
        user1.password = Faker::Lorem.characters(73)
        expect(user1).not_to be_valid
      end
      it '6以上255以下の時登録成功' do
      user1.password = Faker::Lorem.characters(rand(6..72))
      expect(user1).to be_valid
      end
    end
  end

   describe 'ユニーク制約確認' do
    context 'nameが' do
      it '重複している時登録失敗' do
        FactoryBot.create(:user)
        user2 = FactoryBot.build(:user) 
        expect(user2).not_to be_valid
      end
    end
  end

  

end
