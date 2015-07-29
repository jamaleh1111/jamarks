class UsersController < ApplicationController
  def show
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
    @topics = Topic.all
    @user = current_user
  end
end
