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

    #check if the user is nil, if so, create and save a new user
    if @user == nil 
      @user = User.new(params[:id])
      @user.save
    #check if the topic is nil, if so, create and save a new topic
    elsif @topic == nil
      @topic = current_user.topic.build(topic_params)
      @topic.save
   
    #now that youre sure you have a valid user and topic, build and save a new bookmark

    head 200 # what is this?
  end 



  def edit
  end

  private 

  def topic_params
    params.require(:topic).permit(:title, :user)
end


