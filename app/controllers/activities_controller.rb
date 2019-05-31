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

    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
      }
    end

    if params[:activity_query].present?
      @activities = @activities.search_by_name(params[:activity_query])
    end

    if params[:location_query].present?
      @activities = @activities.search_by_location(params[:location_query])
    end

    if @activities.empty?
      flash[:notice] = "😥 There is nothing corresponding to your search, please try again!"
    end

  end
  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @message = Message.new

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
    @activity.category = Category.find(params[:activity][:category])
    @activity.owner = current_user
    authorize @activity
    if @activity.save
      redirect_to dashboard_owner_path
    else
      render :new
    end
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.destroy
  end

  def adding_rating
    @activity.bookings
  end

  #def upcoming_activities
   # @upcoming_activities = policy_scope(Activity).where.not(latitude: nil, longitude: nil)
  #end

  private


  def activity_params
    params.require(:activity).permit(:name, :location, :fitness_level, :time, :duration, :description, :photo_user, :photo_db)
  end
end
