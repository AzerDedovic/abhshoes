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

  @order_id=Order.where(user_id: @user.id).order("created_at").last

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


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
