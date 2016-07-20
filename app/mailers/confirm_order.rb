class ConfirmOrder < ActionMailer::Base
	default :from => 'admin@abhshoes.ba'

  def confirm_order_email(user, order)
    @user = user
    @order = order
    mail( :to => @user.username,
    :subject => 'Abhshoes: Thank you for your order' )
  end
end


