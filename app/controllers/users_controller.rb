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
      flash[:success] = "Registration successful!"
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
      
      @editUser=User.find_by(id: @id)

      @editUser.username=@newUsername

        if (@admin=="admin")
          @editUser.admin=true
        else
          @editUser.admin=false
        end

        if @editUser.save
          redirect_to url_for(:controller => :admin, :action => :users)
        else
          render '/admin/editUser'
        end
    end


end