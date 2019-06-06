class BookingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
    @booking.activity = @activity
    @booking.user = current_user
    authorize @booking
    @booking.save
    # mail = BookingMailer.with(user: current_user ,booking: @booking).create_confirmation
    # mail.deliver_now
    interest = policy_scope(Interest).find_by(activity: @activity, user: current_user)
    if interest.present?
      authorize interest
      interest.destroy
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
