require 'rails_helper'
describe User do
  describe '#create' do
    it 'emailとpasswordとpassword_confirmationがあれば登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'emailなしでは登録できない' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('を入力してください。')
    end

    it 'passwordなしでは登録できない' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include('を入力してください。')
    end

    it 'passwordがあってもpassword_confirmationがなければ登録できない' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません。')
    end

    it '重複するemailは登録できない' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します。')
    end

    it 'passwordが7文字以内は登録できない' do
      user = build(:user, password: '0000000', password_confirmation: '0000000')
      user.valid?
      expect(user.errors[:password]).to include('は8文字以上で入力してください。')
    end
  end
end
