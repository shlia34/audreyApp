class ProductsController < ApplicationController
  def index
    @products = Product.order("date DESC").page(params[:page]).per(12)
  end
end
