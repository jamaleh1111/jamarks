class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = @user.bookmarks
  end
end
