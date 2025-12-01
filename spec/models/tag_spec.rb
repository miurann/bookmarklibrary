require 'rails_helper'

RSpec.describe Tag, type: :model do

  it "名前があれば有効な状態であること" do
    user = FactoryBot.create(:user)
    tag = user.tags.build(
      name: 'Tag name',
    )
    expect(tag).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = FactoryBot.create(:user)
    tag = user.tags.build(name: nil)
    tag.valid?
    expect(tag.errors).to be_of_kind(:name, :blank)
  end

  it "ユーザー単位では同じタグ名を許可しないこと" do
    user = FactoryBot.create(:user)
    user.tags.create(
      name: 'Test tag',
    )
    new_tag = user.tags.build(
      name: 'Test tag',
    )
    new_tag.valid?
    expect(new_tag.errors).to be_of_kind(:name, :taken)
  end

  it "二人のユーザーが同じタグの名前を使うことは許可すること" do
    user = FactoryBot.create(
      :user,
      email: 'test_001@example.com',
    )
    user.tags.create(
      name: 'Test tag',
    )
    other_user = FactoryBot.create(
      :user,
      email: 'test_002@example.com',
    )
    other_tag = other_user.tags.build(
      name: 'Test tag',
    )
    expect(other_tag).to be_valid
  end
end
