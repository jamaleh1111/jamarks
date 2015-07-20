class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.where(email: params[:sender]).first

    @topic = Topic.where(title: params[:subject]).first_or_create # subject

    if @user
     @bookmark = @topic.bookmarks.create(url: params["body-plain"], user_id: @user.id) # body of email
    
    end 

    head 200 
  end 
end


