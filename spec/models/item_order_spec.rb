require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order,item_id: @item.id, user_id: @user.id)
    sleep(0.01)
  end

  describe 'ユーザー新規登録' do
    context '商品の購入ができる' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@item_order).to be_valid
      end
    end
    context '商品の購入ができない' do
      it "tokenが空では登録できないこと" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号の情報が必須である' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号にはハイフンが必要である' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県の情報が必須である' do
        @item_order.prefecture = 0 
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村の情報が必須である' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報が必須である' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号にはハイフンは不要で、11桁以内である' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width characters.")
      end
    end
  end
end
