class ResetPassword < ActionMailer::Base
	default :from => 'admin@abhshoes.ba'

  
  def reset_password(user)
    @user = user
    mail( :to => @user.username,
    :subject => 'Abhshoes: ResetPassword' )
  end
end
