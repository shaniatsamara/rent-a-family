class BookingsController < ApplicationController
  def index
    @past_bookings = Booking.where("end_date < ?", Date.today)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @family = Family.find(params[:family_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @family = Family.find(params[:family_id])
    @booking.user = current_user
    @booking.family = @family
    if @booking.valid?
      total_price = ((@booking.end_date - @booking.start_date) * @family.price)
      @booking.total_price = total_price
      @booking.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(update_params)

    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to families_path
  end

  private

  def booking_params
    params.require(:booking).permit(:payment_method, :total_price, :start_date, :end_date)
  end

  def update_params
    params.require(:booking).permit(:status)
  end
end
