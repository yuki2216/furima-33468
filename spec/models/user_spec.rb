require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが一意性でなければ登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailが@なしでは登録できない" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以下では登録できない" do
      @user.password = "a00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "0000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationの値が一致しないと登録できない" do
      @user.password = "fjoafj"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  describe '新規登録/本人情報確認' do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "a"
      @user.first_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください", "First name 全角文字を使用してください")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.last_name_kana = ""
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カタカナのみで入力して下さい", "First name kana can't be blank", "First name kana 全角カタカナのみで入力して下さい")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "ﾔﾏﾀﾞ"
      @user.first_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end