
require "open-uri"
require "nokogiri"
require "csv"

url = "https://webscraper.io/test-sites/e-commerce/allinone"

begin
  html = URI.open(
    url,
    "User-Agent" => "Dkosmetics Educational Scraper"
  ).read

  document = Nokogiri::HTML(html)

  products = []

  document.css(".thumbnail").each do |item|
    name = item.at_css(".title")&.[]("title") ||
           item.at_css(".title")&.text&.strip

    price = item.at_css(".price")&.text&.strip
    description = item.at_css(".description")&.text&.strip

    next if name.nil? || price.nil?

    products << [name, price, description]
  end

  CSV.open("db/scraped_products.csv", "w") do |csv|
    csv << ["name", "price", "description"]

    products.each do |product|
      csv << product
    end
  end

  puts "Successfully scraped #{products.length} products."
  puts "Saved data to db/scraped_products.csv"

rescue OpenURI::HTTPError, SocketError => e
  warn "Unable to scrape website: #{e.message}"
end
