module CartHelper
	def cartQuantity
		if !signed_in?
			quantity=0
		else
			@user=current_user
			@cart_id=Cart.find_by(user_id: @user.id).id
			@items=CartItem.where(cart_id: @cart_id).order(created_at: :desc).to_a
			quantity=@items.count
		end
		return quantity

	end
end
