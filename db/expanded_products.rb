
# Dkosmetics expanded product inventory
# Adds products until each category contains 25.

product_options = {
  "Lip Glosses" => {
    styles: [
      "Crystal Shine", "Rose Petal", "Caramel Drip",
      "Peach Glow", "Berry Bliss", "Honey Glaze",
      "Pink Diamond", "Mocha Kiss", "Cherry Pop",
      "Golden Hour", "Cocoa Butter", "Soft Nude",
      "Sugar Plum", "Champagne Glow", "Toffee Shine",
      "Strawberry Kiss", "Bronze Glow", "Blush Pink",
      "Vanilla Glaze", "Ruby Shine", "Mauve Magic",
      "Coral Crush", "Espresso Glow", "Peach Sorbet",
      "Brown Sugar", "Pink Pearl", "Cinnamon Glow"
    ],
    type: "Lip Gloss",
    description: "A moisturizing lip gloss with a smooth finish and beautiful shine.",
    price: 14.99
  },

  "Lip Liners" => {
    styles: [
      "Chocolate Brown", "Soft Nude", "Deep Cocoa",
      "Warm Caramel", "Rosewood", "Berry Plum",
      "Mocha Brown", "Dusty Rose", "Classic Nude",
      "Espresso", "Terracotta", "Mauve Rose",
      "Cinnamon", "Chestnut", "Dark Chocolate",
      "Peach Nude", "Ruby Red", "Soft Pink",
      "Brick Red", "Coffee Bean", "Toffee",
      "Wine Berry", "Blush Nude", "Mahogany",
      "Honey Brown", "Plum Wine", "Caramel Nude"
    ],
    type: "Lip Liner",
    description: "A creamy, precise lip liner for defining and shaping the lips.",
    price: 9.99
  },

  "False Lashes" => {
    styles: [
      "Natural Wispy", "Soft Glam", "Dramatic Volume",
      "Cat Eye", "Everyday Natural", "Doll Eye",
      "Fluffy Volume", "Classic Glam", "Luxe Wispy",
      "Bold Drama", "Feather Light", "Date Night",
      "Bridal Glam", "Flutter", "Royal Volume",
      "Sweetheart", "Glam Queen", "Soft Flutter",
      "Midnight Glam", "Angel Eyes", "Dreamy Wispy",
      "Full Flutter", "Elegant Cat Eye",
      "Signature Volume", "Weekend Glam",
      "Natural Flutter", "Ultimate Glam"
    ],
    type: "Lashes",
    description: "Lightweight, reusable false lashes designed for comfortable wear and a beautiful eye look.",
    price: 17.99
  },

  "Beauty Accessories" => {
    styles: [
      "Makeup Brush Set", "Beauty Blender",
      "Lash Applicator", "Makeup Headband",
      "Cosmetic Organizer", "Travel Makeup Bag",
      "Powder Puff Set", "Lip Brush", "Lash Curler",
      "Makeup Mirror", "Brush Cleaning Mat",
      "Beauty Sponge Holder", "Cosmetic Pouch",
      "Makeup Brush Holder", "Lash Storage Case",
      "Silicone Face Scrubber", "Mini Makeup Sponges",
      "Makeup Mixing Palette", "Brow Brush",
      "Travel Brush Set", "Reusable Makeup Pads",
      "Makeup Spatula", "Beauty Tool Organizer",
      "Compact Mirror", "Makeup Sponge Case",
      "Lash Cleaning Brush", "Satin Hair Scrunchies"
    ],
    type: "",
    description: "A practical beauty accessory designed to make your makeup routine easier.",
    price: 12.99
  }
}

product_options.each do |category_name, details|
  category = Category.find_by!(name: category_name)

  details[:styles].each do |style|
    break if category.products.count >= 25

    name = ["Dkosmetics", style, details[:type]]
           .reject(&:empty?)
           .join(" ")

    next if Product.exists?(name: name)

    Product.create!(
      name: name,
      description: "#{name}. #{details[:description]}",
      price: details[:price],
      stock_quantity: rand(15..50),
      category: category
    )
  end
end

puts "Dkosmetics inventory:"
Category.order(:name).each do |category|
  puts "#{category.name}: #{category.products.count} products"
end
puts "TOTAL: #{Product.count} products"
