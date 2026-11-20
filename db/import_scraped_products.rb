
require "csv"

csv_path = Rails.root.join("db", "scraped_products.csv")

category = Category.find_or_create_by!(
  name: "Scraped Demo Products"
) do |c|
  c.description = "Products imported from a third-party website for an educational scraping demonstration."
end

CSV.foreach(csv_path, headers: true) do |row|
  name = row["name"]&.strip
  description = row["description"]&.strip
  price = row["price"]&.delete("$,")&.to_d

  next if name.blank? || description.blank? || price.nil? || price <= 0

  product = Product.find_or_initialize_by(name: name)

  if product.new_record?
    product.description = description
    product.price = price
    product.stock_quantity = 10
    product.category = category
    product.save!

    puts "Imported: #{product.name}"
  else
    puts "Already exists: #{name}"
  end
end

puts "Total products: #{Product.count}"
puts "Scraped demo products: #{category.products.count}"
