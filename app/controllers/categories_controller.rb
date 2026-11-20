
class CategoriesController < ApplicationController
  def index
    @categories = Category
      .where.not(name: "Scraped Demo Products")
      .order(:name)
  end

  def show
    @category = Category
      .where.not(name: "Scraped Demo Products")
      .find(params[:id])

    @products = @category.products.order(:name)
  end
end
