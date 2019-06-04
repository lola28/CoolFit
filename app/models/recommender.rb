class Recommender
  include ActiveModel::Model

  attr_accessor :moderate_hours, :moderate_days, :walking, :vigorous_days, :vigorous_hours

  WEIGHTS = { moderate_hours: 0.15, moderate_days: 0.25, walking: 0.1, vigorous_days: 0.3, vigorous_hours: 0.2 }

  # (7*0.15+7*0.25+7*0.1+7*0.3+7*0.2)/5 = 64.4

  def calculate
    weighted_sum = [ self.moderate_hours.to_i * WEIGHTS[:moderate_hours],
                     self.moderate_days.to_i * WEIGHTS[:moderate_days],
                     self.walking.to_i * WEIGHTS[:walking],
                     self.vigorous_hours.to_i * WEIGHTS[:vigorous_hours],
                     self.vigorous_days.to_i * WEIGHTS[:vigorous_days]].sum


    advice = get_advice((weighted_sum * 100) / 7)

    return advice
  end

  private

  def get_advice(nr)
    if (0..25).include? nr
      "Try out Teamsports, Swimming or a Meditative Walk to get Going. Look at What Vlad and LouLoute offer."
    elsif (26..50).include? nr
      "Try out Yoga, Swimming and a Meditative Walk to get started. Look at what Vlad, LouLoute and Frankie are offering"
    elsif (51..75).include? nr
      "Keep that Level going, try out Surfing, Teamsports and Yoga to get started. Look at What Vlad and Frankie offer."
    elsif (76..95).include? nr
      "Keep Going! Try out Afro Dance, Surfing, Teamsports and Yoga. Look at What Vlad and Frankie offer."
    else
      "To improve your Fitness-Level even more, try out the advanced Yoga and Surf classes. For Fun and Social interaction try out Teamsports!"
    end
  end

end
