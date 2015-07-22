class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else 
      flash[:error] = "There was an error, please try again."
      render :new
    end 
  end 

  def edit
    
  end

  def update
  
  end 

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted!"
      redirect_to @topic
    else
      flash[:error] = "There was an error, please try again."
      render :show
    end 
  end 
    
  private 

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end 

  

  
end
