class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @topic = Topic.find(params[:topic_id])
    #assign the url to a variable after retreiving it from params["body-plain"]

    #check if the user is nil, if so, create and save a new topic
    if @user == nil || @topic == nil
      @topic = Topic.new(params.require(:topic).permit(:title))
      @topic.save
    #check if the topic is nil, if so, create and save a new topic
   
    #now that youre sure you have a valid user and topic, build and save a new bookmark
    
    head 200 # what is this?
  end 
end 


  def edit
  end
end
