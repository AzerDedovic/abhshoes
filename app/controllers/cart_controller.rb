class CartController < ApplicationController


	def show
		@user=current_user
		#@deliveryPrice=Country.find_by(country: 'Bosnia and Herzegovina').delivery
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


			#if (params.has_key?(:color) && params.has_key?(:size))
			if (@item.color != nil && @item.size!=nil)
				@color_id=Color.find_by(color: @item.color).id
				@size_id=Size.find_by(size: @item.size).id
				@numberOfProduct=Variant.find_by(product_id: @item.product_id, size_id: @size_id, color_id: @color_id).quantity
				if @numberOfProduct<@item.quantity
					if @numberOfProduct==0
						flash[:error] = "Out of stock"
					else
					flash[:error] = "Only #{@numberOfProduct} left in stock."
					end
				else
					if @item.save
					flash[:success] = Product.find_by(id: @item.product_id).name + " was just added to your cart."
					@newNumberOfProduct=@numberOfProduct-@item.quantity
					Variant.find_by(product_id: @item.product_id, size_id: @size_id, color_id: @color_id).update(quantity: @newNumberOfProduct)
					end
				end
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
		@countries=Country.all
	end

	def delivery_params
		@user=current_user
		@cart_id=Cart.find_by(user_id: @user.id).id
		@country=params[:country]
  		params.require(:delivery).permit(:full_name, :address, :city, :region, :zip, :phone).merge(cart_id: @cart_id, country: @country)
  	end

  	def billing_address_params
  		@user=current_user
  		@cart_id=Cart.find_by(user_id: @user.id).id
  		params.require(:delivery).permit(:full_name_bill, :address_bill, :city_bill, :region_bill, :zip_bill, :country_bill, :phone_bill).merge(cart_id: @cart_id)
  	end

  	def delivery_address
  		@user=current_user
  		@delivery = Delivery.new(delivery_params)
  		puts params[:billingCheckbox]
  		if params[:billingCheckbox]=="on"
  			@billing = Bill.new()
  			#@billing=@delivery
  			@billing.full_name_bill=@delivery.full_name
  			@billing.address_bill=@delivery.address
  			@billing.city_bill=@delivery.city
  			@billing.region_bill=@delivery.region
  			@billing.zip_bill=@delivery.zip
  			@billing.country_bill=@delivery.country
  			@billing.phone_bill=@delivery.phone
  			@billing.cart_id=@delivery.cart_id
  		else

  			@billing = Bill.new(billing_address_params)
  		end

  		if @delivery.save && @billing.save
  			@cart_id=Cart.find_by(user_id: @user.id).id
			@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
			@item_quantity=@items.count
			@delivery_address=Delivery.where(cart_id: @cart_id).to_a.last
			@billing_address=Bill.where(cart_id: @cart_id).to_a.last
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
		#@delivery_address=Delivery.where(cart_id: @cart_id).to_a.last
		#@billing_address=Bill.where(cart_id: @cart_id).to_a.last
		@delivery_address=Delivery.where(cart_id: @cart_id).order("created_at").last
		@billing_address=Bill.where(cart_id: @cart_id).order("created_at").last
		@delivery_country=@delivery_address.country
		@deliveryPrice=Country.find_by(country: @delivery_country).delivery

  	end

  	def drop
  		@user=current_user
  		@cart_id=Cart.find_by(user_id: @user.id).id
  		@items=CartItem.where(cart_id: @cart_id).to_a
  		@quantity=0
  		@items.each do |item|
  			@size_id=Size.find_by(size: item.size).id
  			@color_id=Color.find_by(color: item.color).id
  			@quantity=Variant.find_by(product_id: item.product_id, size_id: @size_id, color_id: @color_id).quantity
  			Variant.find_by(product_id: item.product_id, size_id: @size_id, color_id: @color_id).update(quantity: @quantity+item.quantity)

  					
  		end
			
  		CartItem.destroy_all(cart_id: @cart_id)

  		redirect_to url_for(:controller => :welcome, :action => :index)
  	end
	
end

