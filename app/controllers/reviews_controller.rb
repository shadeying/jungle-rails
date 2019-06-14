class ReviewsController < ApplicationController

  before_action :require_login

  def create

    @review = Review.new(
      description: review_params['description'],
      rating: review_params['rating'],
      product_id: params['product_id'],
      user_id: current_user.id
    )

    @review.save

    redirect_to :action => "show", :controller => "products", :id => "#{@review.product_id}"

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :action => "show", :controller => "products", :id => "#{@review.product_id}"
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
