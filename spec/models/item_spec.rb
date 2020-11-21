require 'rails_helper'

describe Item do

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test.jpg")
  end

  describe '出品機能' do 

    context '出品がうまくいくとき' do

      it "name、info、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、schecluled_delivery_id、price、userが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空で登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空で登録できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが空で登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_status_idが空で登録できない' do
        @item.sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'shipping_fee_status_idが空で登録できない' do
        @item.shipping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefecture_idが空で登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'schecluled_delivery_idが空で登録できない' do
        @item.schecluled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Schecluled delivery can't be blank")
      end
      it 'priceが空で登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'user_idが空で登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空で登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが１であると登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "sales_status_idが１であると登録できない" do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it "shipping_fee_status_idが１であると登録できない" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it "prefecture_idが１であると登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "schecluled_delivery_idが１であると登録できない" do
        @item.schecluled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Schecluled delivery must be other than 1")
      end
      it "priceに半角数以外が入力されていると登録できない" do
        @item.price = "aあ阿ア"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "299以下の数字が入力されると登録できない" do
        @item.price = 288
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "10,000,000以上の数が入力されると登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

    end

  end

end
