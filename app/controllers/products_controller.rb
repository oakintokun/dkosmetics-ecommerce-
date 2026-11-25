
class ProductsController < ApplicationController
  def index
    @products = available_products.order(:name).limit(12)

    @categories = Category
      .where.not(name: "Scraped Demo Products")
      .order(:name)
  end

  def show
    @product = available_products.find(params[:id])
  end

  def search
    @categories = Category
      .where.not(name: "Scraped Demo Products")
      .order(:name)

    @keyword = params[:keyword].to_s.strip
    @category_id = params[:category_id].presence

    @products = available_products

    if @keyword.present?
      keyword = "%#{ActiveRecord::Base.sanitize_sql_like(@keyword)}%"

      @products = @products.where(
        "products.name ILIKE :keyword OR products.description ILIKE :keyword",
        keyword: keyword
      )
    end

    if @category_id.present?
      @products = @products.where(category_id: @category_id)
    end

    @products = @products.order(:name)
  end

  private

  def available_products
    Product
      .joins(:category)
      .includes(:category)
      .where.not(categories: { name: "Scraped Demo Products" })
  end
end
