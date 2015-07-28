class LikesController < ApplicationController


  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like
    if like.save
      flash[:notice] = "You like this bookmark!"
    else
      flash[:error] = "There was an error, please try again."
    end
    redirect_to @bookmark.topic
  end 

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like
    if like.destroy
      flash[:notice] = "You have deleted this bookmark."
    else
      flash[:error] = "There was an error, please try again."
    end 
    redirect_to @bookmark.topic
  end 
end
