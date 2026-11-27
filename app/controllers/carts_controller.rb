
class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart_items = Product.where(id: session[:cart].keys)
                         .includes(:category)

    @subtotal = @cart_items.sum do |product|
      product.price * session[:cart][product.id.to_s].to_i
    end
  end

  def add
    product = Product.find(params[:product_id])
    product_id = product.id.to_s

    quantity = session[:cart].fetch(product_id, 0).to_i + 1

    if quantity <= product.stock_quantity
      session[:cart][product_id] = quantity
      redirect_to cart_path,
                  notice: "#{product.name} added to your bag.",
                  status: :see_other
    else
      redirect_to cart_path,
                  alert: "Not enough stock available.",
                  status: :see_other
    end
  end

  def update_item
    product = Product.find(params[:product_id])
    quantity = Integer(params[:quantity].to_s, exception: false)

    if session[:cart].key?(product.id.to_s) &&
       quantity && quantity.positive? &&
       quantity <= product.stock_quantity

      session[:cart][product.id.to_s] = quantity

      redirect_to cart_path,
                  notice: "Shopping bag updated.",
                  status: :see_other
    else
      redirect_to cart_path,
                  alert: "Please enter a valid available quantity.",
                  status: :see_other
    end
  end

  def remove
    session[:cart].delete(params[:product_id].to_s)

    redirect_to cart_path,
                notice: "Product removed from your bag.",
                status: :see_other
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
end
