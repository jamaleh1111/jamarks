ActionMailer::Base.smtp_settings = {
  port:              587,
  address:          'smtp.mailgun.org',
  user_name:        ENV['MAILGUN_SMTP_LOGIN'],
  password:         ENV['MAILGUN_SMTP_PASSWORD'],
  domain:           'app5ceddcb1967e427792dde6d69efc3f1c.mailgun.org',  #is this right?  this is for production?
  authentication:   :plain,
  content_type:     'text/html'
}
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = jamaleh@hotmail.com #is this correct?  just my email to test locally? 
    message.cc = nil
    message.bcc = nil
  end 
end 

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end 