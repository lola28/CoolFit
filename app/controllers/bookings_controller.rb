class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.activity = @activity

    if @booking.save
      flash[:alert] = "Thanks for your feedback!"
      redirect_to @activity
    else
      flash[:alert] = "Oops something went wrong!"
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    if @booking.save
      flash[:alert] = "Thanks for your feedback!"
      redirect_to activity_booking_path(@booking)
    else
      flash[:alert] = "Oops something went wrong!"
      render :show
    end
  end

  def show
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.find(params[:id])
    authorize @booking

  end

  private

  def booking_params
    params.require(:booking).permit(:rating)
  end
end
