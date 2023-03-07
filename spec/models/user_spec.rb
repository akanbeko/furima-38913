require 'rails_helper'
 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録できる場合' do
      it '全ての入力事項が、存在すれば登録できる' do
       expect(@user).to be_valid
      end
      it 'パスワードが6文字以上かつ半角英数字混合で登録できる' do
       @user.password = 'a12345'
       @user.password_confirmation = 'a12345'
       expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
       @user.last_name = '山田'
       expect(@user).to be_valid
      end
      it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
       @user.first_name = '太郎'
       expect(@user).to be_valid
      end
      it '名字のフリガナが全角であれば登録できる' do
       @user.last_name_kana = 'ヤマダ'
       expect(@user).to be_valid
      end
      it '名前のフリガナが全角であれば登録できる' do
       @user.first_name_kana = 'タロウ'
       expect(@user).to be_valid
      end
   end
 
    context 'ユーザー登録できない場合' do
      it 'ニックネームが空では投稿できない' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
      end     
      it 'Eメールが空では保存できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
      end
     it 'パスワードが空では投稿できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'パスワードが５文字以下では登録できない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
   it 'パスワード（確認含む）が半角英数字でないと保存できない' do
     @user.password = '123456'
     @user.password_confirmation = '123456'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
   end
   it 'passwordとpassword_confirmationが不一致では登録できない' do
     @user.password =  Faker::Internet.password(min_length: 129)
     @user.password_confirmation =  @user.password
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
   end
   it 'パスワード（確認）が空欄だと保存できない' do
    @user.password = 'a12345'
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
    @user.last_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')
  end
  it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
    @user.first_name = 'taro'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
  end
  it '名字のフリガナが全角（カタカナ）でないと登録できない' do
    @user.last_name_kana = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')
  end
  it '名前のフリガナが全角（カタカナ）でないと登録できない' do
    @user.first_name_kana = 'たろう'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
  end
  it '生年月日が空欄だと保存できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
   it '重複したemailが存在する場合は登録できない' do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
     expect(another_user.errors.full_messages).to include('Email has already been taken')
   end
   it 'emailは@を含まないと登録できない' do
     @user.email = 'testmail'
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
   end
 end
 end
 end
 