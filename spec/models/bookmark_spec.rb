require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:bookmark)).to be_valid
  end

  it "titleが無ければ無効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, title: nil)
    bookmark.valid?
    expect(bookmark.errors).to be_of_kind(:title, :blank)
  end

  it "urlが無ければ無効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, url: nil)
    bookmark.valid?
    expect(bookmark.errors).to be_of_kind(:url, :blank)
  end

  it "urlが適切なフォーマットであれば有効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, url: 'https://test_example.com')
    bookmark.valid?
    expect(bookmark).to be_valid
  end

  it "urlが適切なフォーマットでなければ無効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, url: 'httpexample.com')
    bookmark.valid?
    expect(bookmark.errors).to be_of_kind(:url, :invalid)
  end

  it "titleの文字数が30文字の場合は有効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, title: 'a'* 30)
    bookmark.valid?
    expect(bookmark).to be_valid
  end

  it "titleの文字数が31文字の場合は無効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, title: 'a'* 31)
    bookmark.valid?
    expect(bookmark.errors).to be_of_kind(:title, :too_long)
  end

  it "memoの文字数が200文字の場合は有効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, memo: 'a'* 200)
    bookmark.valid?
    expect(bookmark).to be_valid
  end

  it "memoの文字数が201文字の場合は無効な状態であること" do
    bookmark = FactoryBot.build(:bookmark, memo: 'a'* 201)
    bookmark.valid?
    expect(bookmark.errors).to be_of_kind(:memo, :too_long)
  end

end
