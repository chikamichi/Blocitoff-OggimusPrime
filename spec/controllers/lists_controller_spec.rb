require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  before do
    @user = create(:user)
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, user_id: @user 
      expect(response).to have_http_status(:success)
    end
  end

  # before do
  #   @user = create(:user)
  # end

  # describe "Create new list" do
  #   it "creates new task list for user" do
  #     visit new_list_path
  #     fill_in 'Title', with: @list.title
  #     fill_in 'Description', with: @list.Description
  #     click "Create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "Delete list" do
  #   it "destroys current list and tasks" do
  #     visit list_path 
  #     click "Delete"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
