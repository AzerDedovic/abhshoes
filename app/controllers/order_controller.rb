class OrderController < ApplicationController

	def detail
		@user=current_user
		@order_id = params[:order_id]
		@order=Order.find_by(id: @order_id)
		@items=OrderItem.where(order_id: @order_id).order(name: :asc).to_a
		@delivery_address=Delivery.find_by(id: @order.delivery_id)
		@billing_address=Bill.find_by(id: @order.bill_id)
	end
	def history
		@user=current_user
		@orders=Order.where(user_id: @user.id).to_a
	end
end
