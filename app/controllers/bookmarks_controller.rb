class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    # @bookmark = current_user.bookmark.build( bookmark_params )
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic = @topic
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else 
      flash[:error] = "Oh no, there was an error saving your bookmark. Please try again."
      render :new
    end 
  end 

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.update_attributes( bookmark_params )
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error updating your bookmark, please try again."
      render :edit
    end 
  end 

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Your bookmark was deleted!"
      redirect_to @topic
    else
      flash[:error] = "Oh no, please try deleting that bookmark again!"
      render :show
    end 
  end

  private 

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end 
end
