class Notifier < ActionMailer::Base
  include SendGrid
  
  default :from => "grape@tutorgrape.com"

  def signup_email(user)
    mail( :to => "blair81@gmail.com",
    :subject => "Thanks for signing up" )
  end
end
