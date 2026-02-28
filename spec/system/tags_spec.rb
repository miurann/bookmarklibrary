require 'rails_helper'

RSpec.describe "Tags", type: :system do
  before do
    driven_by(:rack_test)
  end

=begin
scenario "新しいタグを作成する" do
  user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "ログイン"
    expect {
      expect(page).to have_content("ブクマ図書館")

      click_link 'タグ一覧'
      click_button '新規作成'
      fill_in "Name", with: "テストタグ"
      click_button "登録"

      expect(page).to have_content "登録しました"
      expect(page).to have_content "テストタグ"
    }.to change(user.tags, :count).by(1)
  end
=end
end
