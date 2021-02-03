require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    
  describe "商品出品" do
    context '商品出品ができる時' do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
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
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "商品の状態についての情報がなければ保存できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "配送料の負担についての情報がなければ保存できない" do
        @item.shipping_user_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping user must be other than 0")
      end
      it "発送元の地域についての情報がなければ保存できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 0")
      end
      it "発送までの日数についての情報がなければ保存できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end
      it "価格についての情報がなければ保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥299以下の場合は出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください")
      end
      it "価格が¥10,000,000以上では出品できない" do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください")
      end
      it "販売価格は半角数字でなければ保存できない" do
        @item.price = "１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください", "Price 半角数字を使用してください")
      end
      it "販売価格は半角英数混合では登録できないこと" do
        @item.price = "a22"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください", "Price 半角数字を使用してください")
      end
      it "販売価格は半角英語だけでは登録できないこと
      " do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300~9999999円の間にしてください", "Price 半角数字を使用してください")
      end
    end
  end
end