class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.where(email: params['sender']).first
    @topic = Topic.where(name: params[:subject]).first_or_create
    
    if @user
     @topic.bookmarks.create(user: params['stripped-text'], user_id @user.id)
    end 

    head 200 
  end 



  def edit
  end

  private 

  def topic_params
    params.require(:topic).permit(:title, :user)
end


