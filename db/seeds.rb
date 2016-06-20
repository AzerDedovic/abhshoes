# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProductCategory.delete_all

Variant.delete_all
OrderItem.delete_all
Order.delete_all
Delivery.delete_all
Bill.delete_all
CartItem.delete_all
Cart.delete_all
User.delete_all

Product.delete_all
Brand.delete_all
Category.delete_all
Image.delete_all
Color.delete_all
Size.delete_all

Category.create(tag: "m", name: "Men")
Category.create(tag: "w", name: "Women")
Category.create(tag: "k", name: "Kids")
Category.create(tag: "s", name: "Sports")

(18..47).each do |i|
	Size.create(size: i)
end

Color.create(color: "red", code: "#ff0000")
Color.create(color: "blue", code: "#0000ff")
Color.create(color: "yellow", code: "#ffff00")
Color.create(color: "white", code: "#ffffff")
Color.create(color: "black", code: "#000000")
Color.create(color: "green", code: "#008000")

Brand.create(brand:"Converse")
Brand.create(brand:"Vans")
Brand.create(brand:"Skechers")
Brand.create(brand:"Geox")


#Image.create(:default => true, :image => File.new("#{Rails.root}/app/assets/images/shoes1_1.jpg"))

(1..200).each do |f| 
	name = "Shoes" + f.to_s
	description = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
	price = rand(30.00...500.00)
	deleted = false
	brand = Brand.order("RANDOM()").first.id
	image_num = rand(1..8).to_i
	image = "shoes" + image_num.to_s + ".jpg"
	product = Product.create(name: name, description: description, price: price, deleted: deleted, brand_id: brand, image: image)
	if image_num == 1
		product.product_category.create(category_id: Category.find_by_tag('w').id)
	elsif image_num == 2
		product.product_category.create(category_id: Category.find_by_tag('w').id)
	elsif image_num == 3
		product.product_category.create(category_id: Category.find_by_tag('w').id)
	elsif image_num == 4
		product.product_category.create(category_id: Category.find_by_tag('k').id)
	elsif image_num == 5
		product.product_category.create(category_id: Category.find_by_tag('m').id)
	elsif image_num == 6
		product.product_category.create(category_id: Category.find_by_tag('m').id)
		product.product_category.create(category_id: Category.find_by_tag('s').id)
	elsif image_num == 7
		product.product_category.create(category_id: Category.find_by_tag('m').id)
	elsif image_num == 8
		product.product_category.create(category_id: Category.find_by_tag('k').id)

	end	
end


Product.all.each do |p|
	(1..10).each do |size|
		size = Size.order("RANDOM()").first
		to_colors = rand(2..4)
		(1..to_colors).each do 
			Variant.create(product_id: p.id, size_id: size.id, color_id: Color.order("RANDOM()").first.id, quantity: rand(3...25).to_i)
		end
	end
end
