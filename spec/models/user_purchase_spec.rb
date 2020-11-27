require 'rails_helper'

describe UserPurchase do
  describe "商品購入" do

    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    context "商品購入がうまくいくとき" do
      it "user_id、item_id、postal_code、prefecture_id、city、addresses、phone_number、order_idが存在すれば購入できる" do
        expect(@user_purchase).to be_valid
      end
      it "buildingが空でも購入できる" do
        @user_purchase.building = ""
        expect(@user_purchase).to be_valid
      end
    end

    context "商品購入がうまくいかないとき" do
      it "user_idが空のとき購入できない" do
        @user_purchase.user_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空のとき購入できない" do
        @user_purchase.item_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end
      it "postal_codeが空のとき購入できない" do
        @user_purchase.postal_code = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefecture_idが1のとき購入できない" do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空のとき購入できない" do
        @user_purchase.city = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "addressesが空のとき購入できない" do
        @user_purchase.addresses = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it "phone_numberが空のとき購入できない" do
        @user_purchase.phone_number = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "postal_codeに-（ハイフン）が存在しないとき購入できない" do
        @user_purchase.postal_code = "1234567"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberが11桁以上だった場合、購入できない" do
        @user_purchase.phone_number = "090123456789"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end

  end

end
