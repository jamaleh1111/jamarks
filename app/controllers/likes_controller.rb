class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize @like
    if like.save
      flash[:notice] = "You liked this bookmark!"
      redirect_to @bookmark
    else 
      flash[:error] = "If you really like it, please try again!"
      redirect_to @bookmark
    end 
  end 

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize @like
    if like.destroy
      flash[:notice] = "You unliked this bookmark."
      redirect_to @bookmark
    else 
      flash[:error] = "If you really don't like this bookmark, please try again."
      redirect_to @bookmark
    end 
  end 
end
