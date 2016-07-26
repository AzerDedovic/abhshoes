class Newsletter < ActionMailer::Base
	default :from => 'admin@abhshoes.ba'

  def newsletter(email)
    @user = User.find_by(username: email)
    @products = Product.where(onSale: true)
    mail( :to => @user.username,
    :subject => 'Abhshoes: Newsletter' )
  end
end
