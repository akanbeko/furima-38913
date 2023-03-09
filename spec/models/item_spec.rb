require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
end

describe '商品の出品登録の可否' do
  context '出品登録ができる場合' do
    it '全ての入力事項があれば登録できる' do
      expect(@item).to be_valid
    end
    it 'カテゴリーの項目が「---」以外であれば登録できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it '商品状態の項目が「---」以外であれば登録できる' do
      @item.condition_id = 2
      expect(@item).to be_valid
    end
    it '配送料の負担に関する項目が「---」以外であれば登録できる' do
      @item.charge_id = 2
      expect(@item).to be_valid
    end
    it '発送元の地域に関する項目が「---」以外であれば登録できる' do
      @item.area_id= 2
      expect(@item).to be_valid
    end
    it '発送までの日数に関する項目が「---」以外であれば登録できる' do
      @item.days_id = 2
      expect(@item).to be_valid
    end
    it '価格の設定で半角数字で範囲が「300円〜9,999,999円」内であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
  end

  context '出品ができない場合' do
    it 'ユーザー登録している人でないと出品できない' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
    end
    it '画像が添付されていない場合は出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名の項目が空欄の場合は出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明の項目が空欄の場合は出品できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'カテゴリーが「---」の場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態に関する項目が「---」の場合は出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank")
    end

    it '配送料の負担に関する項目が「---」の場合は出品できない' do
      @item.charge_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("can't be blank")
    end

    it '発送元の地域に関する項目が「---」の場合は出品できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("can't be blank")
    end

    it '発送までの日数に関する項目が「---」の場合は出品できない' do
      @item.days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("can't be blank")
    end

    it '価格の項目が空欄の場合は出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("can't be blank")
    end

    it '価格の項目が全角の場合は出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end

    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
  end
end
end
