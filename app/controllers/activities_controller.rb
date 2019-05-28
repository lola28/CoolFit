class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /activities
  # GET /activities.json
  def index
    @activities = policy_scope(Activity).where.not(lat: nil, long: nil)

    @markers = @activities.map do |activity|
      {
        lat: activity.lat,
        lng: activity.long,
        infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity })
      }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    authorze @activity
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
    @activity.user = current_user
    authorize @activity
    # if @activity.save
    #   redirect_to dashboard_path
    # else
    #   render :new
    # end
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    # if @activity.update(activity_params)
    #   redirect_to dashboard_path, notice: "you have just updated an activity"
    # else
    #   render :edit
    # end
  end

    def destroy
     @activity = Activity.find(params[:id])
      authorize @activity
      @activity.destroy

      redirect_to activities_path notice: "You have just deleted an Activity"
    end

  private
    def activity_params
      params.require(:activity).permit(:name, :location, :fitness_level, :price, :time, :duration, :descirption, :photo_user, :photo_db)
    end
end
