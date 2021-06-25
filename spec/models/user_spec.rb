require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
      sleep 0.1
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'メールアドレスは@がなければ登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordは6文字以上じゃないと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは半角英数字混合がないと登録できない（英字）' do
        @user.password = 'abcdfg'
        @user.password_confirmation = 'abcdfg'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordは半角英数字混合がないと登録できない（数字）' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordとpasswrod(確認)は一致していることが必須である' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end

    context '新規登録できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'ニックネームが空でなければ登録できる' do
        @user.nickname = FactoryBot.build(:user, nickname: @user.nickname)
        expect(@user).to be_valid
      end
      it 'メールアドレスが空でなければ登録できる' do
        @user.email = 'email@com'
        expect(@user).to be_valid
      end
      it 'メールアドレスに一意性があれば登録できる' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        expect(@user).to be_valid
      end
      it 'メールアドレスに@があれば登録できる' do
        @user.email = 'email@com'
        expect(@user).to be_valid
      end
      it 'パスワードが空でなければ登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードは半角英数字混合であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードとパスワード（確認）が一致していれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end
  end
end