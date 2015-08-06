class UsersController < ApplicationController
  def show
    @user_bookmarks = current_user.user_bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end

  def update 
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated!"
      redirect_to edit_user_registration_path
    else 
      flash[:error] = "Invalid user information, please try again."
      redirect_to edit_user_registration_path
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end 
end
