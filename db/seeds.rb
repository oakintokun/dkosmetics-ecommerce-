# Dkosmetics product categories and sample inventory

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
  ["Dkosmetics Clear Shine Gloss", "Clear, high-shine lip gloss.", 12.99, 30, "Lip Glosses"],
  ["Dkosmetics Rose Glow Gloss", "Soft pink moisturizing lip gloss.", 14.99, 25, "Lip Glosses"],
  ["Dkosmetics Cocoa Nude Gloss", "Warm brown nude lip gloss.", 14.99, 20, "Lip Glosses"],
  ["Dkosmetics Berry Kiss Gloss", "Berry-tinted glossy lip colour.", 15.99, 20, "Lip Glosses"],
  ["Dkosmetics Chocolate Lip Liner", "Rich brown lip liner pencil.", 8.99, 40, "Lip Liners"],
  ["Dkosmetics Nude Lip Liner", "Neutral nude lip liner pencil.", 8.99, 35, "Lip Liners"],
  ["Dkosmetics Plum Lip Liner", "Deep plum lip liner pencil.", 9.99, 25, "Lip Liners"],
  ["Dkosmetics Everyday Wispy Lashes", "Lightweight natural-looking lashes.", 16.99, 20, "False Lashes"],
  ["Dkosmetics Glam Volume Lashes", "Full-volume lashes for special occasions.", 18.99, 15, "False Lashes"],
  ["Dkosmetics Lash Applicator", "Precision tool for applying false lashes.", 7.99, 30, "Beauty Accessories"],
  ["Dkosmetics Makeup Sponge Set", "Soft blending sponges for flawless makeup.", 11.99, 25, "Beauty Accessories"],
  ["Dkosmetics Satin Beauty Headband", "Comfortable headband for makeup and skincare.", 10.99, 20, "Beauty Accessories"]
]

products.each do |name, description, price, stock, category_name|
  product = Product.find_or_initialize_by(name: name)
  product.description = description
  product.price = price
  product.stock_quantity = stock
  product.category = Category.find_by!(name: category_name)
  product.save!
end

puts "Seeded #{Category.count} categories and #{Product.count} products."