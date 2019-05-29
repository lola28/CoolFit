class InterestsController < ApplicationController
  def create
    @activity = policy_scope(Activity).find(params[:activity_id])
    @interest = Interest.new
    authorize @interest
    @interest.activity = @activity
    @interest.user = current_user
    @interest.save

    redirect_to request.referrer
  end

  def destroy
    @activity = policy_scope(Activity).find(params[:activity_id])
    @interest = policy_scope(Interest).where({ activity: @activity, user: current_user }).first
    authorize @interest
    @interest.destroy
  end
end
