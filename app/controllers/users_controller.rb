class UsersController < ApplicationController
  before_action :authenticate_user!
  # , except: [:show]

  def show
    @user = current_user # || User.find(params[:id])
    @lists = current_user.lists
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

