class ActivitiesController < ApplicationController
  #before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  layout "showpage", only: [:show]

  # GET /activities
  # GET /activities.json
  def index
    @activities = policy_scope(Activity).where.not(latitude: nil, longitude: nil)

    @user_interests = []
    @activities.each do |activity|
      interests = policy_scope(Interest).where({ activity: activity, user: current_user })
      @user_interests << interests.first if !interests.first.nil?
    end

    @user_registrations = []
    @activities.each do |activity|
      registrations = policy_scope(Booking).where({ activity: activity, user: current_user })
      @user_registrations << registrations.first if !registrations.first.nil?
    end

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
        image_url: helpers.asset_url('running-circle.png')
      }
    end

    if params[:activity_query].present?
      @activities = @activities.search_by_name(params[:activity_query])
      @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
        image_url: helpers.asset_url('running-circle.png')
      }
      end
    end

    if params[:location_query].present?
      @activities = @activities.search_by_location(params[:location_query])
      @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
        image_url: helpers.asset_url('running-circle.png')
      }
      end
    end

  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @message = Message.new
    # @activity.max_capacity = activity.current_capacity

    @markers =
      [{
        lat: @activity.latitude,
        lng: @activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: @activity })
      }]
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    authorize @activity
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    authorize @activity

    health_ids = params[:activity][:health_ids]
    health_ids.each do |id|
      if !id.blank?
        health_relation = HealthRelation.new
        health_relation.health = Health.find(id)
        health_relation.activity = @activity
        health_relation.save
      end
    end

    if @activity.save
      redirect_to owner_dashboard_path(current_user)
    else
      render :new
    end
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    if @activity.update(activity_params)
      redirect_to owner_dashboard_path(current_user), notice: "You just updated your event"
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.destroy
  end

  def adding_rating
    @activity.bookings
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :category_id, :location, :fitness_level, :time, :duration, :description, :photo_user, :photo_db, :max_capacity)
  end
end
