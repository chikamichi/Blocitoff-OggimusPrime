require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "User flow" do

  before do
    @user = create(:user)
  end

  describe "Signed in" do

    describe "successfully" do
      it "the username or email address indicates user is logged in" do
        visit root_path

        within '.user-info' do
          click_link "Sign In"
        end

        fill_in 'Login', with: @user.email
        fill_in 'Password', with: @user.password

        within 'form' do
          click_button 'Sign in'
        end

        expect(page).to have_content(@user.username || @user.email)
      end
    end
  end

  describe "Signed out" do

    describe "successfully" do
      it "the sign in link is displayed" do
        login_as(@user)
        visit root_path

        within '.user-info' do
          page.find(:xpath, "//a[@href='/users/sign_out']").click
        end

        expect(page).to have_content("Sign In")
      end
    end
  end

  describe "Password reset" do

    describe "successfully" do
      it "indicates password has been reset successfully" do
        login_as(@user)

        visit edit_user_registration_path

        fill_in 'Enter new password', with: 'helloworld1'
        fill_in 'New password confirmation', with: 'helloworld1'
        fill_in 'Enter current password', with: @user.password
        click_button 'Update'

        expect(page).to have_content("Your account has been updated successfully.")
      end
    end
  end
end