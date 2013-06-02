class Notifier < ActionMailer::Base
  include SendGrid

  
  default :from => "welcome@tutorgrape.com"

  def signup_email(profile)
    if Rails.env.production?
      @activation_url = "http://tutorgrape.herokuapp.com/activate/"+profile.activation_key
    else
      @activation_url = "http://0.0.0.0:3000/activate/"+profile.activation_key
    end

    @profile = profile
    
    mail( :to => profile.email,:subject => "Activate Profile!") do |format|
      format.html { render :layout => "../notifier/signup_email"}
    end
  end
end
