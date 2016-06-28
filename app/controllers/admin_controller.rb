class AdminController < ApplicationController
	def dashboard
  		@user=current_user
  		@categories=Category.all
  		@users=User.all
  		@products=Product.all
   	end

  	def shoes
  		@user=current_user
      @products=Product.all

  	end

  	def users 
  		@user=current_user
      @users=User.all
  	end

    def categories
      @user=current_user
      @categories=Category.all
    end

    def deleteUser
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          @order_id=Order.where(:user_id => id).select('order_id')
          OrderItem.where(:order_id => @order_id).destroy_all
          Order.where(:user_id => id).destroy_all
          @cart_id=Cart.where(:user_id => id).select('cart_id')
          Delivery.where(:cart_id => @cart_id).destroy_all
          Bill.where(:cart_id => @cart_id).destroy_all
          CartItem.where(:cart_id => @cart_id).destroy_all
          Cart.where(:user_id => id).destroy_all
          User.where(:id => id).destroy_all
        end
      else 
        @order_id=Order.where(:user_id => @id_s).select('order_id')
        OrderItem.where(:order_id => @order_id).destroy_all
        Order.where(:user_id => @id_s).destroy_all
        @cart_id=Cart.where(:user_id => @id_s).select('cart_id')
        Delivery.where(:cart_id => @cart_id).destroy_all
        Bill.where(:cart_id => @cart_id).destroy_all
        CartItem.where(:cart_id => @cart_id).destroy_all
        Cart.where(:user_id => @id_s).destroy_all
        User.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :users)
    end

    def editUser
      @user=current_user
      @id=params[:id]
      @editUser=User.find_by(id: @id)
    end

    

    def addUser
      @user=current_user
      @newUser=User.new()
    end

    def addCategory
      @user=current_user
      @newCategory=Category.new()
    end

    def editCategory
      @user=current_user
      @id=params[:id]
      @editCategory=Category.find_by(id: @id)
    end

    def deleteCategory
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          
          if ProductCategory.where(:category_id => id).count!=0
            @product_id=ProductCategory.find_by(:category_id => id).product_id
            Variant.where(product_id: @product_id).destroy_all
            ProductCategory.where(:category_id => id).destroy_all
            Product.where(id: @product_id).destroy_all
            Category.where(:id => id).destroy_all
          else
            Category.where(:id => id).destroy_all
          end

        end
      else 
        
        if ProductCategory.where(:category_id => @id_s).count!=0
          @product_id=ProductCategory.find_by(:category_id => @id_s).product_id
          Variant.where(product_id: @product_id).destroy_all
          ProductCategory.where(:category_id => @id_s).destroy_all
          Product.where(id: @product_id).destroy_all
          Category.where(:id => @id_s).destroy_all
        else
          Category.where(:id => @id_s).destroy_all
        end
      end
      redirect_to url_for(:controller => :admin, :action => :categories)
    end

    def category_params
      params.require(:createCategory).permit(:name, :tag)
    end

    def createCategory
      @user=current_user
      @newCategory=Category.new(category_params)
      if @newCategory.save
        redirect_to url_for(:controller => :admin, :action => :categories)
      else
        render '/admin/addCategory'
      end
    end

    def updateCategory
      @user=current_user
      @id=params[:id]
      @newName=params[:name]
      @newTag=params[:tag]

      @editCategory=Category.find_by(id: @id)
      @editCategory.name=@newName
      @editCategory.tag=@newTag

      if @editCategory.save
        redirect_to url_for(:controller => :admin, :action => :categories)        
      else
        render '/admin/editCategory'
      end


    end

    def viewOrders
      @user=current_user
      @id=params[:id]
      @orders=Order.where(user_id: @id).to_a
    end

    def detailOrder
      @user=current_user
      @id=params[:id]
      @order=Order.find_by(id: @id)
      @items=OrderItem.where(order_id: @id).order(name: :asc).to_a
      @delivery_address=Delivery.find_by(id: @order.delivery_id)
      @billing_address=Bill.find_by(id: @order.bill_id)
    end

    def brands
      @user=current_user
      @brands=Brand.all
    end
    def addBrand
      @user=current_user
      @newBrand=Brand.new()
    end
    def deleteBrand
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          Product.where(:brand_id => id).destroy_all
          Brand.where(:id => id).destroy_all
        end
      else 
        Product.where(:brand_id => @id_s).destroy_all
        Brand.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :brands)
    end
    def editBrand
      @user=current_user
      @id=params[:id]
      @editBrand=Brand.find_by(id: @id)
    end

    def brand_params
      params.require(:createBrand).permit(:brand)
    end

    def createBrand
      @user=current_user
      @newBrand=Brand.new(brand_params)
      if @newBrand.save
        redirect_to url_for(:controller => :admin, :action => :brands)
      else
        render '/admin/addBrand'
      end
    end

    def updateBrand
      @user=current_user
      @id=params[:id]
      @newBrand=params[:brand]
      
      @editBrand=Brand.find_by(id: @id)
      @editBrand.brand=@newBrand

      if @editBrand.save
        redirect_to url_for(:controller => :admin, :action => :brands)        
      else
        render '/admin/editBrand'
      end
    end

    def colors
      @user=current_user
      @colors=Color.all
    end

    def addColor
      @user=current_user
      @newColor=Color.new()
    end
    def deleteColor
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          Variant.where(:color_id => id).destroy_all
          Color.where(:id => id).destroy_all
        end
      else 
        Variant.where(:color_id => @id_s).destroy_all
        Color.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :colors)
    end
    def editColor
      @user=current_user
      @id=params[:id]
      @editColor=Color.find_by(id: @id)
    end

    def color_params
      params.require(:createColor).permit(:color, :code)
    end

    def createColor
      @user=current_user
      @newColor=Color.new(color_params)
      if @newColor.save
        redirect_to url_for(:controller => :admin, :action => :colors)
      else
        render '/admin/addColor'
      end
    end

    def updateColor
      @user=current_user
      @id=params[:id]
      @newColor=params[:color]
      @newCode=params[:code]
      
      @editColor=Color.find_by(id: @id)
      @editColor.color=@newColor
      @editColor.code=@newCode

      if @editColor.save
        redirect_to url_for(:controller => :admin, :action => :colors)        
      else
        render '/admin/editColors'
      end
    end


    def sizes
      @user=current_user
      @sizes=Size.all
    end

    def addSize
      @user=current_user
      @newSize=Size.new()
    end
    def deleteSize
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          Variant.where(:size_id => id).destroy_all
          Size.where(:id => id).destroy_all
        end
      else 
        Variant.where(:size_id => @id_s).destroy_all
        Size.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :sizes)
    end
    def editSize
      @user=current_user
      @id=params[:id]
      @editSize=Size.find_by(id: @id)
    end

    def size_params
      params.require(:createSize).permit(:size)
    end

    def createSize
      @user=current_user
      @newSize=Size.new(size_params)
      if @newSize.save
        redirect_to url_for(:controller => :admin, :action => :sizes)
      else
        render '/admin/addSize'
      end
    end

    def updateSize
      @user=current_user
      @id=params[:id]
      @newSize=params[:size]
          
      @editSize=Size.find_by(id: @id)
      @editSize.size=@newSize

      if @editSize.save
        redirect_to url_for(:controller => :admin, :action => :sizes)        
      else
        render '/admin/editSize'
      end
    end

    def addShoes
      @user=current_user
      @newShoes=Product.new()
      @brands=Brand.all
      @categories=Category.all
    end

    def editShoes
      @user=current_user
      @id=params[:id]
      @editShoes=Product.find_by(id: @id)
      @brands=Brand.all
      @categories=Category.all
      @brand=Brand.find_by(id: @editShoes.brand_id).brand
      @category_id=ProductCategory.find_by(product_id: @editShoes.id).category_id
      @category=Category.find_by(id: @category_id).name

    end

    def deleteShoes
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          Variant.where(:product_id => id).destroy_all
          ProductCategory.where(:product_id => id).destroy_all
          Product.where(:id => id).destroy_all
        end
      else 
        Variant.where(:product_id => @id_s).destroy_all
        ProductCategory.where(:product_id => @id_s).destroy_all
        Product.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :shoes)
    end

    def viewVariants
      @user=current_user
      @id=params[:id]
      @variants=Variant.where(product_id: @id).all
    end
    def shoes_params

      params.require(:createShoes).permit(:name, :description, :price, :image)
    end

    def createShoes
      @user=current_user
      @brands.Brand.all
      @categories=Category.all
      @brand=params[:brand]
      @name=params[:name]
      @price=params[:price]
      @description=params[:description]
      @category=params[:category]
      @category_id=Category.find_by(name: @category).id
      @brand_id=Brand.find_by(brand: @brand).id
      @newShoes=Product.new(shoes_params)
      @newShoes.brand_id=@brand_id
      @productCategory=ProductCategory.new()
      @productCategory.category_id=@category_id
      if @newShoes.save
        @product_id=@newShoes.id
        @productCategory.product_id=@product_id
        @productCategory.save
        redirect_to url_for(:controller => :admin, :action => :addVariants, :product_id => @product_id)

      else
        render '/admin/addShoes'
      end
    end

    def updateShoes
      @user=current_user
      @id=params[:id]
      @newName=params[:name]
      @newDescription=params[:description]
      @newPrice=params[:price]
      @newImage=params[:image]
      @newBrand=params[:brand]
      @newBrand_id=Brand.find_by(brand: @newBrand).id
      @newCategory=params[:category]
      @newCategory_id=Category.find_by(name: @newCategory).id
          
      @editShoes=Product.find_by(id: @id)
      @editShoes.name=@newName
      @editShoes.description=@newDescription
      @editShoes.price=@newPrice
      @editShoes.image=@newImage
      @editShoes.brand_id=@newBrand_id

      if @editShoes.save
        @product_category=ProductCategory.find_by(product_id: @editShoes.id)
        @product_category.category_id=@newCategory_id
        @product_category.save
        redirect_to url_for(:controller => :admin, :action => :shoes)        
      else
        render '/admin/editShoes'
      end
    end

    def addVariants
      @user=current_user
      @product_id=params[:product_id]
      @newVariants=Variant.new()
      @sizes=Size.all
      @colors=Color.all
    end

    def editVariants
      @user=current_user
      @variant_id=params[:id]
      @product_id=params[:product_id]
      @colors=Color.all
      @sizes=Size.all
      @variant=Variant.find_by(id: @variant_id)
      @editVariants=Variant.find_by(id: @variant_id)
    end

    def deleteVariants
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]

     
      if params[:id]
        @id.each do |id|
          @product_id=Variant.find_by(id: id).product_id
          Variant.where(:id => id).destroy_all
        end
      else 
        @product_id=Variant.find_by(id: @id_s).product_id
        Variant.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :viewVariants, :id => @product_id)
    end

    def createVariants
      @user=current_user
      @product_id=params[:product_id]
      @size=params[:size]
      @quantity=params[:quantity]
      @color=params[:color]
      @size_id=Size.find_by(size: @size).id
      @color_id=Color.find_by(color: @color).id

      @newVariants=Variant.new()
      @newVariants.product_id=@product_id
      @newVariants.size_id=@size_id
      @newVariants.color_id=@color_id
      @newVariants.quantity=@quantity
      if @newVariants.save
        redirect_to url_for(:controller => :admin, :action => :viewVariants, :id => @product_id)

      else
        render '/admin/addVariants'
      end
    end

    def updateVariants
      @user=current_user
      @product_id=params[:product_id]
      @variant_id=params[:variant_id]
      @size=params[:size]
      @quantity=params[:quantity]
      @color=params[:color]
      @size_id=Size.find_by(size: @size).id
      @color_id=Color.find_by(color: @color).id

      @editVariants=Variant.find_by(id: @variant_id)
      @editVariants.product_id=@product_id
      @editVariants.size_id=@size_id
      @editVariants.color_id=@color_id
      @editVariants.quantity=@quantity
      if @editVariants.save
        redirect_to url_for(:controller => :admin, :action => :viewVariants, :id => @product_id)

      else
        render '/admin/editVariants'
      end
    end

    def countries
      @user=current_user
      @countries=Country.all
    end

    def addCountry
      @user=current_user
      @newCountry=Country.new()
    end

    def deleteCountry
      @user=current_user
      @id=params[:id].to_a
      @id_s=params[:id_s]
     
      if params[:id]
        @id.each do |id|
          Country.where(:id => id).destroy_all
        end
      else 
        Country.where(:id => @id_s).destroy_all
      end
      redirect_to url_for(:controller => :admin, :action => :countries)
    end

    def editCountry
      @user=current_user
      @id=params[:id]
      @editCountry=Country.find_by(id: @id)
    end

    def updateCountry
      @user=current_user
      @id=params[:id]
      @newCountry=params[:country]
      @newDeliveryPrice=params[:delivery]
      
      @editCountry=Country.find_by(id: @id)
      @editCountry.country=@newCountry
      @editCountry.delivery=@newDeliveryPrice

      if @editCountry.save
        redirect_to url_for(:controller => :admin, :action => :countries)        
      else
        render '/admin/editCountry'
      end
    end

    def country_params
      params.require(:createCountry).permit(:country, :delivery)
    end

    def createCountry
      @user=current_user
      @newCountry=Country.new(country_params)
      if @newCountry.save
        redirect_to url_for(:controller => :admin, :action => :countries)
      else
        render '/admin/addCountry'
      end
    end

    
end

