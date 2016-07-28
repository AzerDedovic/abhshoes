class SessionsController < ApplicationController
  def new
  end

  #def create
  	#user = User.authenticate(params[:session][:username], params[:session][:password])

  	#if user.nil?
  	#	flash.now[:error] = "Invalid username or password!"
  	#	render :new
  	#else
    #  if user.email_confirmed
    #		  sign_in user
        
  	#	  #redirect_to user
     #     if user.admin
      #    redirect_to url_for(:controller => :admin, :action => :dashboard)
       #   else
       #   redirect_to url_for(:controller => :welcome, :action => :index)
        #  end
      #else 
      #  flash.now[:error] = 'Please activate your account by following the 
      #  instructions in the account confirmation email you received to proceed.'
       # render :new
     # end
    #end
#end

  def create
    user = User.authenticate(params[:session][:username], params[:session][:password])
    if user 
      if user.email_confirmed
        if params[:session][:remember_me] == "1"
          cookies.permanent[:remember_token] = user.remember_token
          
        else
          cookies[:remember_token] = user.remember_token
          
        end
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
    else
      flash.now[:error] = "Invalid username or password!"
      render "new"
    end
  end

  def destroy
  	cookies.delete(:remember_token)
  	redirect_to url_for(:controller => :welcome, :action => :index)
  end
end
