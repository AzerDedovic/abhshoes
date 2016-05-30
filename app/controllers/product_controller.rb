class ProductController < ApplicationController

	def show
		@user=current_user
		@tag=params[:tag]
		#@category=Category.new
		@category_id=Category.where(tag: @tag).select('id')
		@category=Category.where(tag: @tag).to_a
		@product_category=ProductCategory.where(category_id: @category_id).select('product_id')
		@products=Product.where(id: @product_category).to_a





		

		#@product_category=ProductCategory.where(category_id: @category.category_id).to_a
		#@products=Product.where(product_id: @product_id).all

	end

	




	def detail
		@user=current_user
		@id=params[:id]
		@product=Product.where(id: @id).to_a

		@chosenColor=params[:color_id]
		@chosenSize=params[:size_id]


		#@sizes_id=Variant.where(product_id: @id).select('size_id')
		#@sizes=Size.where(id: @sizes_id).to_a

		#@colors_id=Variant.where(product_id: @id).select('color_id')
		#@colors=Color.where(id: @colors_id).to_a

		







		


		if !@chosenColor.present? and !@chosenSize.present?
			@sizes_id=Variant.where(product_id: @id).select('size_id')
			@sizes=Size.where(id: @sizes_id).order('size ASC').to_a

			@colors_id=Variant.where(product_id: @id).select('color_id')
			@colors=Color.where(id: @colors_id).order('color ASC').to_a


		
		
		elsif @chosenSize.present? and !@chosenColor.present? 
			@colors_id=Variant.where(product_id: @id, size_id: @chosenSize.to_i).select('color_id')
			@colors=Color.where(id: @colors_id).order('color ASC').to_a
			@sizes_id=Variant.where(product_id: @id).select('size_id')
			@sizes=Size.where(id: @sizes_id).order('size ASC').to_a
			@chosenS=Size.where(id: @chosenSize).to_a
			

		elsif @chosenColor.present? and !@chosenSize.present?
			@sizes_id=Variant.where(product_id: @id, color_id: @chosenColor.to_i).select('size_id')
			@sizes=Size.where(id: @sizes_id).order('size ASC').to_a
			@colors_id=Variant.where(product_id: @id).select('color_id')
			@colors=Color.where(id: @colors_id).order('color ASC').to_a
			@chosenC=Color.where(id: @chosenColor).to_a
			
		#elsif @chosenColor.present? and @chosenSize.present?
		elsif @chosenColor.present? and @chosenSize.present?
			
			@chosenC=Color.where(id: @chosenColor)
			@chosenS=Size.where(id: @chosenSize)
			
			@sizes_id=Variant.where(product_id: @id).select('size_id')
			@sizes=Size.where(id: @sizes_id).order('size ASC').to_a

			@colors_id=Variant.where(product_id: @id).select('color_id')
			@colors=Color.where(id: @colors_id).order('color ASC').to_a
		end







		

		
		@category_id=ProductCategory.where(product_id: @id).select('category_id')
		@product_category=ProductCategory.where(category_id: @category_id).select('product_id')
		@featured_product=Product.where(id: @product_category).limit(8).order("RANDOM()")

		


	end



end
