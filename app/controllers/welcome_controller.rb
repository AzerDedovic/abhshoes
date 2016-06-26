class WelcomeController < ApplicationController
  def index
  	@user=current_user
  	#@featured_product=Product.take(16)
  	@featured_product=Product.limit(16).order("RANDOM()")


  end

 
end


