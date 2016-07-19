class RegistrationMailer < ActionMailer::Base
  default :from => 'admin@abhshoes.ba'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def registration_email(user)
    @user = user
    mail( :to => @user.username,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end