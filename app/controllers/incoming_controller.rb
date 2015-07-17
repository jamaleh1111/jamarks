class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.where(email: params['sender']).first
    if @user
      puts "we have user"
    else
      puts "no user"
    end

    @topic = Topic.where(title: params[:subject]).first_or_create # subject

    if @topic
      puts "we have topic"
    else
      puts "no topic"
    end

    if @user
      puts "about to create bookmark"
     @bookmark = @topic.bookmarks.create(url: params["body-plain"], user_id: @user.id) # body of email
    
    end 
    if @bookmark
      puts "created bookmark #{@bookmark.url}"
    else
      puts "no bookmark created"
    end



    head 200 
  end 
end


