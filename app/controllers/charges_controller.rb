class ChargesController < ApplicationController
def new
end

def create
  # Amount in cents
  
  #@total = params[:total]
  @user=current_user
  @total = params[:amount]
  @amount = @total.to_i
  @cart_id=Cart.find_by(user_id: @user.id).id
  @delivery_address=Delivery.where(cart_id: @cart_id).order("created_at").last
  @billing_address=Bill.where(cart_id: @cart_id).order("created_at").last


  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'bam'
  )
  @order=Order.new()
  @order.user_id=@user.id
  @order.total_price=(@total.to_f/100)
  @order.delivery_id=@delivery_address.id
  @order.bill_id=@billing_address.id
  @order.save

  #CreateOrderItems(@order)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
