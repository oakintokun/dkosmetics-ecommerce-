
# Dkosmetics product categories and inventory

categories = {
  "Lip Glosses" => "Shiny, moisturizing lip glosses for every occasion.",
  "Lip Liners" => "Smooth lip liners for defining and shaping lips.",
  "False Lashes" => "Beautiful lashes for everyday and glam looks.",
  "Beauty Accessories" => "Essential accessories for your beauty routine."
}

categories.each do |name, description|
  category = Category.find_or_initialize_by(name: name)
  category.description = description
  category.save!
end

products = [
  # Lip Glosses
  ["Dkosmetics Clear Shine Gloss", "Clear, high-shine lip gloss.", 12.99, 30, "Lip Glosses"],
  ["Dkosmetics Rose Glow Gloss", "Soft pink moisturizing lip gloss.", 14.99, 25, "Lip Glosses"],
  ["Dkosmetics Cocoa Nude Gloss", "Warm brown nude lip gloss.", 14.99, 20, "Lip Glosses"],
  ["Dkosmetics Berry Kiss Gloss", "Berry-tinted glossy lip colour.", 15.99, 20, "Lip Glosses"],
  ["Dkosmetics Caramel Drip Lip Gloss", "Warm caramel gloss with a smooth, shiny finish.", 14.99, 25, "Lip Glosses"],
  ["Dkosmetics Champagne Glow Lip Gloss", "Champagne shimmer gloss with a luminous finish.", 14.99, 25, "Lip Glosses"],

  # Lip Liners
  ["Dkosmetics Chocolate Lip Liner", "Rich brown lip liner pencil.", 8.99, 40, "Lip Liners"],
  ["Dkosmetics Nude Lip Liner", "Neutral nude lip liner pencil.", 8.99, 35, "Lip Liners"],
  ["Dkosmetics Plum Lip Liner", "Deep plum lip liner pencil.", 9.99, 25, "Lip Liners"],
  ["Dkosmetics Rosewood Lip Liner", "Soft rose-brown liner for defined lips.", 9.99, 30, "Lip Liners"],
  ["Dkosmetics Chestnut Lip Liner", "Warm chestnut brown lip liner.", 9.99, 30, "Lip Liners"],
  ["Dkosmetics Ruby Red Lip Liner", "Bold ruby red liner for statement lips.", 9.99, 25, "Lip Liners"],

  # False Lashes
  ["Dkosmetics Everyday Wispy Lashes", "Lightweight natural-looking lashes.", 16.99, 20, "False Lashes"],
  ["Dkosmetics Glam Volume Lashes", "Full-volume lashes for special occasions.", 18.99, 15, "False Lashes"],
  ["Dkosmetics Soft Glam Lashes", "Soft, fluffy lashes for an elegant makeup look.", 17.99, 25, "False Lashes"],
  ["Dkosmetics Cat Eye Lashes", "Flared lashes designed to elongate the eyes.", 17.99, 25, "False Lashes"],
  ["Dkosmetics Doll Eye Lashes", "Rounded lashes for a wide-eyed appearance.", 17.99, 20, "False Lashes"],
  ["Dkosmetics Bridal Glam Lashes", "Elegant lashes for weddings and special events.", 17.99, 20, "False Lashes"],

  # Beauty Accessories
  ["Dkosmetics Lash Applicator", "Precision tool for applying false lashes.", 7.99, 30, "Beauty Accessories"],
  ["Dkosmetics Makeup Sponge Set", "Soft blending sponges for flawless makeup.", 11.99, 25, "Beauty Accessories"],
  ["Dkosmetics Makeup Brush Set", "A collection of soft brushes for everyday makeup application.", 12.99, 20, "Beauty Accessories"],
  ["Dkosmetics Makeup Headband", "Comfortable headband for makeup and skincare.", 12.99, 25, "Beauty Accessories"],
  ["Dkosmetics Travel Makeup Bag", "Stylish cosmetic bag for storing beauty essentials.", 12.99, 20, "Beauty Accessories"],
  ["Dkosmetics Lash Curler", "Beauty tool designed to lift and curl natural lashes.", 12.99, 25, "Beauty Accessories"]
]

products.each do |name, description, price, stock, category_name|
  product = Product.find_or_initialize_by(name: name)
  product.description = description
  product.price = price
  product.stock_quantity = stock if product.new_record?
  product.category = Category.find_by!(name: category_name)
  product.save!
end

puts "Dkosmetics inventory:"

Category.order(:name).each do |category|
  puts "#{category.name}: #{category.products.count} products"
end

puts "TOTAL: #{Product.count} products"
