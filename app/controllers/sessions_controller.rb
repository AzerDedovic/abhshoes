class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:session][:username], params[:session][:password])

  	if user.nil?
  		flash.now[:error] = "Invalid username or password!"
  		render :new
  	else
      if user.email_confirmed
  		  sign_in user
        
  		  #redirect_to user
          if user.admin
          redirect_to url_for(:controller => :admin, :action => :dashboard)
          else
          redirect_to url_for(:controller => :welcome, :action => :index)
          end
      else 
        flash.now[:error] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed.'
        render :new
      end
    end
end
  def destroy
  	sign_out
  	redirect_to url_for(:controller => :welcome, :action => :index)
  end
end
