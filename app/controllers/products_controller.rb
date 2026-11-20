
class ProductsController < ApplicationController
  def index
    @products = Product
      .joins(:category)
      .includes(:category)
      .where.not(categories: { name: "Scraped Demo Products" })
      .order(:name)
      .limit(12)

    @categories = Category
      .where.not(name: "Scraped Demo Products")
      .order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end
