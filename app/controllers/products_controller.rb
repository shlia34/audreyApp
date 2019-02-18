class ProductsController < ApplicationController
  def index
    @products = Product.where('date LIKE(?)', "%#{params[:keyword]}%").order("date DESC").page(params[:page]).per(12)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.includes(:user)
  end
end

