class ReviewsController < ApplicationController

  def create
    @review = Review.new(
      description: review_params['description'],
      rating: review_params['rating'],
      product_id: params['product_id'],
      user_id: current_user.id
    )
    @review.save

    redirect_to products_path
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
