class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    # @bookmarks = @topics.bookmarks

  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    if @topic.save 
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving this topic.  Please try again."
      render :new
    end 
  end 

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes( topic_params )
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else 
      flash[:error] = "Sorry!  There was an error saving the topic, please try again."
      render :edit
    end 
  end 

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "Oops!  There was an error deleting the topic. Please try again!"
      render :show
    end 
  end 

  private

  def topic_params
    params.require(:topic).permit(:title)
  end 
end
