class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.activity = @activity

    if @booking.save
      flash[:alert] = "Thanks for your feedback!"
      redirect_to activity_booking_path(@activity)
    else
      flash[:alert] = "Oops something went wrong!"
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:rating)
  end
end
