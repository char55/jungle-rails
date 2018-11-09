  class ProductsController < ApplicationController

  before_filter :authorize

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.order(created_at: :desc)
    @review = Review.new
  end



end
