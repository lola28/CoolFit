class BookingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
    @booking.activity = @activity
    @booking.user = current_user
    authorize @booking
    if @activity.bookings.size < @activity.max_capacity
      @booking.save
      interest = policy_scope(Interest).where({ activity: @activity, user: current_user }).first
      authorize interest
      interest.destroy
    else
      flash[:alert] = "Sorry, the class is full!"
      redirect_to request.referrer
    end

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
