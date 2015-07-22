class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    # show bookmarks associated with it
  end

  def new
    @topic= Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
      flash[:notice] = "Topic was saved!"
    else
      flash[:error] = "There was an error, please try again."
      render :new
    end    
  end 

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      redirect_to @topic
    else
      flash[:error] = "There was an error, please try again."
      render :edit
    end 
  end 

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was deleted!"
    else
      flash[:error] = "There was an error, please try again."
    end
    redirect_to topics_path
  end 

  private

  def topic_params
    params.require(:topic).permit(:title)
  end 
 
end
