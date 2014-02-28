class TransitMailer < ActionMailer::Base
  default from: "management@example.com"

  def complete_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "aska.ong91@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
