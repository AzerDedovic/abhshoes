class WelcomeController < ApplicationController
  def index
  	@user=current_user
  	#@featured_product=Product.take(16)
  	if Product.where(onSale: true).count > 8
  		@sales=Product.where(onSale: true).limit(8).order("RANDOM()")
  	else
  		@sales=Product.where(onSale: true).order("RANDOM()")
  	end
  	@featured_product=Product.limit(16).order("RANDOM()")
  	#@featured_product=Product.where(onSale: true)


  end

 
end


