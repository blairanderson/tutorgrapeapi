# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tutorgrapeapi::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => "blairanderson",
  :password => ENV['SENDGRIDPASSWORD'],
  :domain => "tutorgrape.herokuapp.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
