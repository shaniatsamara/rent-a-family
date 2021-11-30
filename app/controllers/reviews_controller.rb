class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:id])
    @review.booking = @booking
    @review.save

    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end