require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品の出品' do
    context '出品ができるとき' do
      it "入力必須項目のデータがあれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品ができないとき' do
      it 'が空では登録できない' do
      end
    end
  end
end
