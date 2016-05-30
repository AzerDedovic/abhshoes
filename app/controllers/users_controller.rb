class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def user_params
  	params.require(:users).permit(:username, :password, :password_confirmation)
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    #@user.password = BCrypt::Password.create(:password)
     if @user.save
       flash[:success] = "Registration successful!"
     else
        
      render 'new'
      #flash[:error] = "Sorry, your registration attempt was unsuccessful."
    end
  end

  def show
    @user = User.find(params[:id])
  end
end