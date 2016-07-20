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
      @cart = Cart.create(user_id: @user.id)
      flash[:success] = "Please confirm your email address to continue."
      RegistrationMailer.registration_email(@user).deliver
     else
        
      render 'new'
      #flash[:error] = "Sorry, your registration attempt was unsuccessful."
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def user_params_dashboard
      @admin=params[:admin]
      params.require(:createUser).permit(:username, :password, :password_confirmation).merge(admin: @admin)
  end

  def createUser
      @user=current_user
      @newUser = User.new(user_params_dashboard)
      @newUser.email_confirmed = true
      if @newUser.save
        @cart = Cart.create(user_id: @newUser.id)
        flash[:success] = "Registration successful!"
        redirect_to url_for(:controller => :admin, :action => :users)
     else
        
      render '/admin/addUser'
      
      end


    end
    

    def updateUser
      @user=current_user
      @id=params[:id]
      @newUsername=params[:email]
      @admin=params[:admin]
      @activated=params[:activated]
      
      @editUser=User.find_by(id: @id)

      @editUser.username=@newUsername

        if (@admin=="admin")
          @editUser.admin=true
        else
          @editUser.admin=false
        end

        if (@activated=="activated")
          @editUser.email_confirmed=true
        else
          @editUser.email_confirmed=false
        end

        if @editUser.save(validate: false)
          redirect_to url_for(:controller => :admin, :action => :users)
        else
          render '/admin/editUser'
        end
    end

    def confirm_email

      @confirm_token=params[:confirm_token]
      @user = User.find_by(confirm_token: @confirm_token)
      if @user!=nil
        @user.email_confirmed=true 
        #@user.confirm_token = nil
        puts @user
        @user.save(validate: false)
        flash[:success] = "Welcome to the abhshoes! Your email has been confirmed.
        Please sign in to continue."
        #redirect_to new_session_url
        #render '/sessions/new'
      else
        flash[:error] = "Sorry. User does not exist."
        #redirect_to new_session_url
        #render '/sessions/new'
      end
    end

    def newPassword
      #@user = User.new
      @email=params[:username]
      @user=User.find_by(username: @email)

      if @user != nil
        ResetPassword.reset_password(@user).deliver
        flash[:success] = "Check your email inbox, and click the link in the email you received to reset your password."
      else
        flash[:error] = "Sorry. User does not exist"
        render '/users/resetPassword'
      end


    end

    def resetPassword
      @user = User.new
    end

    def enterNewPassword
      @confirm_token=params[:confirm_token]
      @user=User.find_by(confirm_token: @confirm_token)
    end

    def setNewPassword
      @confirm_token=params[:confirm_token]
      @password=params[:password]
      @password_confirmation=params[:password_confirmation]
      #params.require(:createUser).permit(:username, :password, :password_confirmation).merge(admin: @admin)
      @user=User.find_by(confirm_token: @confirm_token)
      puts @user
      @user.password=@password
      @user.password_confirmation=@password_confirmation
      if @user.valid?
        @user.save
        flash[:success] = "Password updated successfully."
        redirect_to url_for(:controller => :sessions, :action => :new)
      else
        render '/users/enterNewPassword'
      end



    end


end