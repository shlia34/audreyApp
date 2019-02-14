class ReviewsController < ApplicationController

  def create
    @review = Review.create(text: review_params[:text],
                            product_id: review_params[:product_id],
                            user_id: current_user.id)
    redirect_to "/products/#{@review.product.id}"
  end

  private
  def review_params
    params.permit(:text, :product_id)
  end

end
