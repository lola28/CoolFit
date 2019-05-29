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
end
