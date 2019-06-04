class RecomendationsController < ApplicationController

  def new

  end

  def create
    @recomendation = Recommender.new(recomendation_params)
    authorize @recomendation
    @result = @recomendation.calculate

    redirect_to root_path(result: @result)
  end

  private

  def recomendation_params
    params.permit(:moderate_hours, :moderate_days, :walking, :vigorous_days, :vigorous_hours)
  end

end
