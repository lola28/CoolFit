class BookingsController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.new
    @booking.activity = @activity
    @booking.user = current_user
    @booking.save

    interests = current_user.interests
    @interest = interests.select { |interest| interest.activity == @activity }
    @interest.first.destroy

    redirect_to request.referrer
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @booking = Booking.where({ activity: @activity, user: current_user }).first
    authorize @booking
    Booking.destroy(@booking.id)

    redirect_to request.referrer
  end
end
