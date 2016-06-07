class ChargesController < ApplicationController
def new
end

def create
  # Amount in cents
  
  #@total = params[:total]
  @total = 200
  @amount = @total*100

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

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
