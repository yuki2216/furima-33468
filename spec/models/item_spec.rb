require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    
  describe "商品出品" do
    it "必要な情報を適切に入力すると、商品の出品ができること" do
      expect(@item).to be_valid
    end
    it "商品画像を1枚以上なければ保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名がなければ保存できない" do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品の説明がなければ保存できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリーの情報がなければ保存できない" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it "商品の状態についての情報がなければ保存できない" do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end
    it "配送料の負担についての情報がなければ保存できない" do
      @item.shipping_user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping user can't be blank", "Shipping user is not a number")
    end
    it "発送元の地域についての情報がなければ保存できない" do
      @item.shipping_area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
    end
    it "発送までの日数についての情報がなければ保存できない" do
      @item.shipping_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
    end
    it "価格についての情報がなければ保存できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥300~¥9,999,999の間でなければ保存できない" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください")
    end
    it "販売価格は半角数字でなければ保存できない" do
      @item.price = "１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください", "Price 半角数字を使用してください")
    end
  end
end