require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_address.addresses = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '電話番号にハイフンを含むと保存できないこと' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number Input only number')
    end
    it '電話番号は11桁以内でないと保存できないこと' do
      @order_address.phone_number = '000000000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number Input only number')
    end
  end
end
