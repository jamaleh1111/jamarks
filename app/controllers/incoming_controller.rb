class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.find(params[:sender])
    @topic = Topic.find(params[:subject])
    url = params["body-plain"]
    #assign the url to a variable after retreiving it from params["body-plain"]

    #check if the user is nil, if so, create and save a new user
    if @user.nil? 
      @user = User.new(:sender)
      @user.save
    #check if the topic is nil, if so, create and save a new topic
    elsif @topic.nil?
      @topic = current_user.topic.build(topic_params)
      @topic.save
   
    #now that youre sure you have a valid user and topic, build and save a new bookmark
    else 
      @bookmark = topic.bookmark.build(bookmark_params)
      if @bookmark.save
        flash[:notice] = "Bookmark was saved."
        redirect_to @bookmark
      else
        flash[:error] = "There was an error saving the post.  Please try again."
        render :incoming #where do i want to go?
    head 200 # what is this?
  end 



  def edit
  end

  private 

  def topic_params
    params.require(:topic).permit(:title, :user)
end


