class BookingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
    authorize @booking
    @booking.activity = @activity
    @booking.user = current_user
    @booking.save

    interest = policy_scope(Interest).where({ activity: @activity, user: current_user }).first
    authorize interest
    interest.destroy
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.where({ activity: @activity, user: current_user }).first
    authorize @booking
    @booking.destroy
  end

  def edit
    redirect_to dashboard_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.user = current_user
    # @booking.rating = rating
    authorize @booking

    @booking.update(booking_params)
    if @booking.save
      flash[:alert] = "Thanks for your feedback!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Oops something went wrong!"
      render :show
    end
  end

private

  def booking_params
    params.require(:booking).permit(:rating)
  end

end
