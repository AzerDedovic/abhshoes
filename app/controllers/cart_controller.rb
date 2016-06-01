class CartController < ApplicationController


	def show
		@user=current_user
		if !signed_in?
			flash[:error] = "Please login to view your cart"
			redirect_to url_for(:controller => :sessions, :action => :new)
			
		else
		@cart_id=Cart.find_by(user_id: @user.id).id
		@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
		@item_quantity=@items.count
	end
		
	end
	def cart_params
	@user_id=current_user.id
	@cart = Cart.find_by(user_id: @user_id).id
  	params.require(:cart_item).permit(:product_id, :color, :size, :quantity).merge(cart_id: @cart)
  end

	def add
		if signed_in?
		@user=current_user
		@id = params[:product_id]
		@item = CartItem.new(cart_params)
		if @item.save
			flash[:success] = Product.find_by(id: @item.product_id).name + " was just added to your cart."
		else
			flash[:error] = "Please choose size and color."
		end
		
		redirect_to url_for(:controller => :product, :action => :detail, :id => @item.product_id )
		else 
			flash[:error] ="Please Login to Add Item to Your Cart."
		redirect_to url_for(:controller => :sessions, :action => :new)

		end
	end

	def delivery
		@user=current_user
		@cart_id=Cart.find_by(user_id: @user.id).id
		@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
		@item_quantity=@items.count
	end

	def delivery_params
	@user=current_user
	@cart_id=Cart.find_by(user_id: @user.id).id
  	params.require(:delivery).permit(:full_name, :address, :city, :region, :zip, :country, :phone).merge(cart_id: @cart_id)
  	end

  	def delivery_address
  		@user=current_user
  		@delivery = Delivery.new(delivery_params)
  		if @delivery.save
  			@cart_id=Cart.find_by(user_id: @user.id).id
			@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
			@item_quantity=@items.count
			@delivery_address=Delivery.where(cart_id: @cart_id).to_a.last
			redirect_to url_for(:controller => :cart, :action => :confirmation)
		else
			flash[:error] = "Please enter address in correct format."
			redirect_to url_for(:controller => :cart, :action => :delivery)
		end



  	end

  	def confirmation
  		@user=current_user
  		
  		@cart_id=Cart.find_by(user_id: @user.id).id
		@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
		@item_quantity=@items.count
		@delivery_address=Delivery.where(cart_id: @cart_id).to_a.last

  	end
	
end

