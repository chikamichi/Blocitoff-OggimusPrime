require 'rails_helper'

describe "Sign up flow" do

  describe "confirmable" do
    before do
      @user = create(:user)

    end

    it "sends confirmation email when user signs up" do
    end

    it "doesn't allow sign up when email is invalid" do
    end

    it "doesn't allow sign up with duplicate email" do
    end
  end
end