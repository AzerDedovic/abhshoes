class AdminController < ApplicationController
	def dashboard
  		@user=current_user
  		@categories=Category.all
  		@users=User.all
  		@products=Product.all
   	end

  	def shoes
  		@user=current_user
      @products=Product.all

  	end

  	def users 
  		@user=current_user
      @users=User.all
  	end

    def categories
      @user=current_user
      @categories=Category.all
    end

    def deleteUser
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          @order_id=Order.where(:user_id => id).select('order_id')
          OrderItem.where(:order_id => @order_id).destroy_all
          Order.where(:user_id => id).destroy_all
          @cart_id=Cart.where(:user_id => id).select('cart_id')
          Delivery.where(:cart_id => @cart_id).destroy_all
          Bill.where(:cart_id => @cart_id).destroy_all
          CartItem.where(:cart_id => @cart_id).destroy_all
          Cart.where(:user_id => id).destroy_all
          User.where(:id => id).destroy_all
        end
      else 
        @order_id=Order.where(:user_id => @id_s).select('order_id')
        OrderItem.where(:order_id => @order_id).destroy_all
        Order.where(:user_id => @id_s).destroy_all
        @cart_id=Cart.where(:user_id => @id_s).select('cart_id')
        Delivery.where(:cart_id => @cart_id).destroy_all
        Bill.where(:cart_id => @cart_id).destroy_all
        CartItem.where(:cart_id => @cart_id).destroy_all
        Cart.where(:user_id => @id_s).destroy_all
        User.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :users)
    end

    def editUser
      @user=current_user
      @id=params[:id]
      @editUser=User.find_by(id: @id)
    end

    

    def addUser
      @user=current_user
      @newUser=User.new()
    end

    def addCategory
      @user=current_user
      @newCategory=Category.new()
    end

    def editCategory
      @user=current_user
      @id=params[:id]
      @editCategory=Category.find_by(id: @id)
    end

    def deleteCategory
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          ProductCategory.where(:category_id => id).destroy_all
          Category.where(:id => id).destroy_all
        end
      else 
        ProductCategory.where(:category_id => @id_s).destroy_all
        Category.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :categories)
    end

    def category_params
      params.require(:createCategory).permit(:name, :tag)
    end

    def createCategory
      @user=current_user
      @newCategory=Category.new(category_params)
      if @newCategory.save
        redirect_to url_for(:controller => :admin, :action => :categories)
      else
        render '/admin/addCategory'
      end
    end

    def updateCategory
      @user=current_user
      @id=params[:id]
      @newName=params[:name]
      @newTag=params[:tag]

      @editCategory=Category.find_by(id: @id)
      @editCategory.name=@newName
      @editCategory.tag=@newTag

      if @editCategory.save
        redirect_to url_for(:controller => :admin, :action => :categories)        
      else
        render '/admin/editCategory'
      end


    end

    def viewOrders
      @user=current_user
      @id=params[:id]
      @orders=Order.where(user_id: @id).to_a
    end

    def detailOrder
      @user=current_user
      @id=params[:id]
      @order=Order.find_by(id: @id)
      @items=OrderItem.where(order_id: @id).order(name: :asc).to_a
      @delivery_address=Delivery.find_by(id: @order.delivery_id)
      @billing_address=Bill.find_by(id: @order.bill_id)
    end
    
end


  