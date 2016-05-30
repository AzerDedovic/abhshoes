class CartController < ApplicationController

	def show
		@user=current_user
	end
	def add
		@user=current_user
		@id=params[:id]
		redirect_to url_for(:controller => :product, :action => :detail, :id => @id )
	end
end
