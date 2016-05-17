class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:session][:username], params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "Invalid username or password!"
  		render :new
  	else
  		sign_in user
  		#redirect_to user
      redirect_to url_for(:controller => :welcome, :action => :index)
    end
end
  def destroy
  	sign_out
  	redirect_to url_for(:controller => :welcome, :action => :index)
  end
end
