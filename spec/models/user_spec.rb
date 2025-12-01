require 'rails_helper'

RSpec.describe User, type: :model do

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前、メール、パスワード、パスワード(確認)があれば有効な状態であること" do
    user = User.new(
    name: 'Jane',
    email: 'example_mail@example.com',
    password: 'abcdefghijk',
    password_confirmation: 'abcdefghijk',
    )
    expect(user).to be_valid
  end

  it "名がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors).to be_of_kind(:name, :blank)
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors).to be_of_kind(:email, :blank)
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: 'example_mail@example.com')
    user = FactoryBot.build(:user, email: 'example_mail@example.com')
    user.valid?
    expect(user.errors).to be_of_kind(:email, :taken)
  end

  it "名前が20文字の場合は有効な状態であること" do
    user = FactoryBot.build(:user, name: 'a'* 20)
    user.valid?
    expect(user).to be_valid
  end

  it "名前が21文字の場合は無効な状態であること" do
    user = FactoryBot.build(:user, name: 'a'* 21)
    user.valid?
    expect(user.errors).to be_of_kind(:name, :too_long)
  end

  it "パスワードが8文字の場合は有効な状態であること" do
    user = FactoryBot.build(
      :user,
      password: 'a'* 8,
      password_confirmation: 'a'* 8
      )
    user.valid?
    expect(user).to be_valid
  end

  it "パスワードが7文字の場合は無効な状態であること" do
    user = FactoryBot.build(
      :user,
      password: 'a'* 7,
      password_confirmation: 'a'* 7
      )
    user.valid?
    expect(user.errors).to be_of_kind(:password, :too_short)
  end

  it "パスワードが20文字の場合は有効な状態であること" do
    user = FactoryBot.build(
      :user,
      password: 'a'* 20,
      password_confirmation: 'a'* 20
      )
    user.valid?
    expect(user).to be_valid
  end

  it "パスワードが21文字の場合は無効な状態であること" do
    user = FactoryBot.build(
      :user,
      password: 'a'* 21,
      password_confirmation: 'a'* 21
      )
    user.valid?
    expect(user.errors).to be_of_kind(:password, :too_long)
  end

  it "パスワード(確認)がパスワードと一致していれば有効な状態であること" do
    user = FactoryBot.build(
      :user,
      password: '12345678',
      password_confirmation: '12345678'
      )
    user.valid?
    expect(user).to be_valid
  end

  it "パスワード(確認)がパスワードと一致していなければ無効な状態であること" do
    user = FactoryBot.build(
    :user,
    password: '12345678',
    password_confirmation: 'abcdefgh',
    )
    user.valid?
    expect(user.errors).to be_of_kind(:password_confirmation, :confirmation)
  end
end
