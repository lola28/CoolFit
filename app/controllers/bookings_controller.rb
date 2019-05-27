class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.activity = @activity

    if @booking.save
      redirect_to @activity
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:ratings)
  end
end
