class RecomendationsController < ApplicationController

  def new

  end

  def create
    recommender = Recommender.new(recomendation_params)

    authorize recommender

    @recommendations = recommender.calculate

    @recommendations.map do |recommendation|
      interest = Interest.new
      authorize interest
      interest.user = current_user
      interest.activity = recommendation
      interest.save
    end

    render 'pages/dashboard'
  end

  private

  def recomendation_params
    params.permit(:moderate_hours, :moderate_days, :walking, :vigorous_days, :vigorous_hours)
  end

end


