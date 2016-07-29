class ProductController < ApplicationController

	def show
		@user=current_user
		@colors=Color.all.to_a
		@sizes=Size.all.to_a
		@brands=Brand.all.to_a
		@tag=params[:tag]	
		@category_id=Category.where(tag: @tag).select('id')
		@category=Category.where(tag: @tag).to_a
		@product_category=ProductCategory.where(category_id: @category_id).select('product_id')

		@products=Product.where(id: @product_category)
	end

	def products

		@user=current_user
		@tag=params[:tag]
		@min=params[:min]
		@max=params[:max]
		@color_id=params[:color]
		@size_id=params[:size]
		@brand_id=params[:brand]

		@products_id_color=Variant.where(color_id: @color_id).select('product_id')
		@products_id_size=Variant.where(size_id: @size_id).select('product_id')


		@category_id=Category.where(tag: @tag).select('id')
		@category=Category.where(tag: @tag).to_a
		@product_category=ProductCategory.where(category_id: @category_id).select('product_id')
		@products=Product.where(id: @product_category)

		@products=@products.where(id: @product_category, price: @min..@max) if params[:min] && params[:max]
		
		@products=@products.where(id: @products_id_color) if params[:color]
		@products=@products.where(id: @products_id_size) if params[:size]

		@products=@products.where(brand_id: @brand_id) if params[:brand]

		@products=@products.where(id: @product_category).order("price ASC").to_a if params[:price_ASC]
		@products=@products.where(id: @product_category).order("price DESC").to_a if params[:price_DESC]


	end

	def sales
		@user=current_user
		@colors=Color.all.to_a
		@sizes=Size.all.to_a
		@brands=Brand.all.to_a

		@products=Product.where(onSale: true)
	end

	def sales_products

		@user=current_user
		@tag=params[:tag]
		@min=params[:min]
		@max=params[:max]
		@color_id=params[:color]
		@size_id=params[:size]
		@brand_id=params[:brand]

		@products_id_color=Variant.where(color_id: @color_id).select('product_id')
		@products_id_size=Variant.where(size_id: @size_id).select('product_id')


		
		@products=Product.where(onSale: true)

		@products=@products.where(onSale: true, sale_price: @min..@max) if params[:min] && params[:max]
		
		@products=@products.where(id: @products_id_color) if params[:color]
		@products=@products.where(id: @products_id_size) if params[:size]

		@products=@products.where(brand_id: @brand_id) if params[:brand]

		@products=@products.where(onSale: true).order("sale_price ASC").to_a if params[:price_ASC]
		@products=@products.where(onSale: true).order("sale_price DESC").to_a if params[:price_DESC]

		


	end

	




	def detail
		@user=current_user
		@id=params[:id]
		@product=Product.find_by(id: @id)

		@chosenColor=params[:color_id]
		@chosenSize=params[:size_id]

		########### ISPRAVNO N+1 ####################
		#@shoes=Variant.includes(:color).limit(30)

		#@shoes.each do |k|
		#	puts k.color.color
		#end
		#############################################

		########### POGRESNO N+1 ####################
		#@shoes=Variant.limit(30)

		#@shoes.each do |k|
		#	puts k.color.color
		#end
		#############################################

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

	#def variants
	#	@user=current_user

	#	@id=params[:id]
	#	@size=params[:size_id]
	#	@color=params[:color_id]

	#	@product=Product.find_by(id: @id)

	#	@variants=Variant.where(product_id: @id)

	#	@sizes_id=@variants.select('size_id')
	#	@colors_id=@variants.select('color_id')

	#	@colors_id=@variants.where(size_id: @size).select('color_id') if params[:size_id]
	#	@sizes_id=@variants.where(color_id: @color).select('size_id') if params[:color_id]

	#	@sizes=Size.where(id: @sizes_id).order('size ASC').to_a
	#	@colors=Color.where(id: @colors_id).order('color ASC').to_a

	#end



end
