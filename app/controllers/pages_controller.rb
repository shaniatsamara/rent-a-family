class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :index, :show]
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #@families = Family.joins(:booking).where(review )
  end

  def dashboard
    @seller_bookings = Booking.joins(:family).where(family: { user: current_user })
    @pending_bookings = current_user.bookings.where(status: "Pending")
    @current_bookings = current_user.bookings.where(status: "Accept")
    @rejected_bookings = current_user.bookings.where(status: "Reject")
    # page to see all your bookings / profile of the person
  end

end
