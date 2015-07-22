class UserMailer < ApplicationMailer
  default from: 'notifications@example.com' #whose email do i need here?

  def welcome_email(user)
    @user = user 
    @url = 'http://jamarks.herokuapp.com' #what url do i need here?
    mail(to: @user.email, subject: 'Welcome to Jamarks!')
  end 
end
