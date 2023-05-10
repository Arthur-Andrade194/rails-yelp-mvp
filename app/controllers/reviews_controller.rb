class ReviewsController < ApplicationController


  def new
    # creates instance and associates to restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) # finding associated restaurant
    @review = Review.new
  end


  def create
    # saves new review to db
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
