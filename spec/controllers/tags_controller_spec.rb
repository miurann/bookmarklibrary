require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe "#index" do

    context "ログイン済みユーザー" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常にレスポンスを返すこと" do
        login_user(@user)
        get :index
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        login_user(@user)
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストユーザー" do
      it "302レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "ログイン画面にリダイレクトすること" do
        get :index
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#show" do
    context "タグ作成ユーザー" do
      before do
        @user = FactoryBot.create(:user)
        @tag = FactoryBot.create(:tag, user: @user)
      end

      it "正常にレスポンスを返すこと" do
        login_user(@user)
        get :show, params: { id: @tag.id }
        expect(response).to be_successful
      end
    end

    context "タグ作成者ではないユーザー" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @tag = FactoryBot.create(:tag, user: other_user)
      end

      it "ActiveRecord::RecordNotFound を返すこと" do
        login_user(@user)
        expect{
          get :show, params: { id: @tag.id }
      }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
