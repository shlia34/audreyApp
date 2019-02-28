class LikesController < ApplicationController

  before_action :set_variables

  def create
    like = current_user.likes.new(product_id: @product.id)
    like.save
    @product.reload
  end

  def destroy
    like = current_user.likes.find_by(product_id: @product.id)
    like.destroy
    @product.reload
  end

  private
  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end

