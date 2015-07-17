class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.where(email: params['sender']).first
    @topic = Topic.where(title: params[:subject]).first_or_create
    
    if @user
     @topic.bookmarks.create(url: params['stripped-text'], user_id: @user.id)
    end 

    head 200 
  end 
end


