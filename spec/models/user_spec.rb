require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(email: '')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it '他のユーザーとemailが重複すると登録できない' do
      user = User.new(email: '')
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
  end
end
