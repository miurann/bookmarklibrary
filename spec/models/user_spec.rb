require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、パスワード、パスワード(確認)があれば有効な状態であること
  it "is valid with a name, email, password, and password_confirmation" do
    user = User.new(
    name: 'Jane',
    email: 'example_mail@example.com',
    password: 'abcdefghijk',
    password_confirmation: 'abcdefghijk',
    )
    expect(user).to be_valid
  end

  # 名がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name: 'Jane',
      email: 'example_mail@example.com',
      password: 'abcdefghijk',
      password_confirmation: 'abcdefghijk'
    )
    user = User.new(
      name: 'Mary',
      email: 'example_mail@example.com',
      password: 'abcdefghijk',
      password_confirmation: 'abcdefghijk'
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
