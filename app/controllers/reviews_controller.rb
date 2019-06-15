class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find params['product_id']
    @review = Review.new(
      description: review_params['description'],
      rating: review_params['rating'],
      product: @product,
      user_id: current_user.id
    )

    @review.save

    redirect_to product_path(@product)

  end

  def destroy
    @product = Product.find params['product_id']
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to write a review"
      redirect_to '/login'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
