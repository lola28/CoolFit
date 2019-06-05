class Recommender
  include ActiveModel::Model

  attr_accessor :moderate_hours, :moderate_days, :walking, :vigorous_days, :vigorous_hours

  WEIGHTS = { moderate_hours: 0.15, moderate_days: 0.25, walking: 0.1, vigorous_days: 0.3, vigorous_hours: 0.2 }

  # (7*0.15+7*0.25+7*0.1+7*0.3+7*0.2)/5 = 64.4

  def calculate
    weighted_sum = [
      @moderate_hours.to_i * WEIGHTS[:moderate_hours],
      @moderate_days.to_i * WEIGHTS[:moderate_days],
      @walking.to_i * WEIGHTS[:walking],
      @vigorous_hours.to_i * WEIGHTS[:vigorous_hours],
      @vigorous_days.to_i * WEIGHTS[:vigorous_days]
    ].sum

    get_advice((weighted_sum * 100) / 7)
  end

  private

  def get_advice(nr)
    if (0..35).include? nr
      Activity.where(fitness_level: 1)
    elsif (36..70).include? nr
      Activity.where(fitness_level: 2)
    else
      Activity.where(fitness_level: 3)
    end
  end
end
