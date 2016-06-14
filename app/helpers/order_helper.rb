module OrderHelper
	def CreateOrderItems(order_id)
		@order_id=order_id
		@user=current_user
		@cart_id=Cart.find_by(user_id: @user.id).id

		@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a

		@items.each do |item|
			@order_item=OrderItem.new()

			@order_item.name=Product.find_by(id: item.product_id).name
			@order_item.price=Product.find_by(id: item.product_id).price
			@order_item.image=Product.find_by(id: item.product_id).image
			@order_item.size=item.size
			@order_item.color=item.color
			@order_item.quantity=item.quantity
			@order_item.order_id=@order_id

			@order_item.save

		end

		CartItem.destroy_all(cart_id: @cart_id)

	end




end
