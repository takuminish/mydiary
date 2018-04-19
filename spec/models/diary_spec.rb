# coding: utf-8
require 'rails_helper'

RSpec.describe Diary, type: :model do
  let(:diary1) {FactoryBot.create(:diary)}
  
  
  describe '登録確認' do
    context 'statementとdisplay_dateとuser_idが' do
      it '正しい時登録成功' do
        expect(diary1).to be_valid
      end
    end
  end
  describe 'バリデーション確認' do
    context 'statementが' do
      it '空の時登録失敗' do
        diary1.statement = nil
        expect(diary1).not_to be_valid
      end
    end
    context 'display_dateが' do
      it '空の時登録失敗' do
        diary1.display_date = nil
        expect(diary1).not_to be_valid
      end
    end
    context 'user_idが' do
      it 'user.idに存在していない時登録失敗' do
        diary1.user_id = rand(1..4)
        expect(diary1).not_to be_valid
      end
    end
  end

end
