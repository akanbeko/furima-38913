require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先に関する情報の保存' do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

 
    context '保存が可能' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end

      it '郵便番号が空ではない、且つハイフン入りの７桁であれば保存できる' do
        @order_address.send_number = '123-4567'
        expect(@order_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_address.area_id = 2
        expect(@order_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_address.city = '東京都'
        expect(@order_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_address.address = '1'
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
      it '電話番号が11ケラ以下且つハイフンなしであれば保存できる' do
        @order_address.phone_number = 11111111111
        expect(@order_address).to be_valid
      end
    end

    context '保存が不可能' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_address.send_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Send number can't be blank", "Send number is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_address.send_number = 1111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Send number is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村が空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_address.phone_number = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @order_address.phone_number = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end