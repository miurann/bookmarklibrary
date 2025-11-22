require 'rails_helper'

RSpec.describe Tag, type: :model do
  #名前があれば有効な状態であること
  it "is valid with name" do
    user = User.create(
      name: 'Jane',
      email: 'example_mail@example.com',
      password: 'abcdefghijk',
      password_confirmation: 'abcdefghijk'
    )
    tag = user.tags.build(
      name: 'Tag name',
    )
    expect(tag).to be_valid
  end

  #名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.create(
      name: 'Jane',
      email: 'example_mail@example.com',
      password: 'abcdefghijk',
      password_confirmation: 'abcdefghijk'
    )
    tag = user.tags.build(name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("を入力してください")
  end

  #ユーザー単位では同じタグ名を許可しないこと
  it "does not allow duplicate tag names per user" do
    user = User.create(
      name: 'Jane',
      email: 'example_mail@example.com',
      password: 'abcdefghijk',
      password_confirmation: 'abcdefghijk'
    )
    user.tags.create(
      name: 'Test tag',
    )
    new_tag = user.tags.build(
      name: 'Test tag',
    )
    new_tag.valid?
    expect(new_tag.errors[:name]).to include("はすでに存在します")
  end

#二人のユーザーが同じタグの名前を使うことは許可すること
end
