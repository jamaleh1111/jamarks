class UsersController < ApplicationController
  def show
    @user_bookmarks = current_user.user_bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
