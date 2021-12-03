class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @families = Family.all.sort_by { |family| family.average_rating }.reverse.first(3)
  end

  def dashboard
    @user = current_user
    @current_user_families = Family.where(user: @user)
    @seller_bookings = Booking.joins(:family).where(family: { user: current_user })
    @pending_seller_bookings = @seller_bookings.where(status: "Pending")
    @current_seller_bookings = @seller_bookings.where(status: ["Accepted", "Rejected"])
    @current_bookings = current_user.bookings
    # page to see all your bookings / profile of the person
  end
end
