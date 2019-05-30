class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  layout "homepage", only: [:home]

  def home
    categories_hash = {}
    Category.all.each do |category|
      categories_hash[category] = category.activities.count
    end
    top_categories = categories_hash.sort_by { |_k, v| v }.reverse[0..2]
    @top_category1 = top_categories[0][0]
    @top_category2 = top_categories[1][0]
    @top_category3 = top_categories[2][0]
  end

  def dashboard
    @user_activities = policy_scope(Activity).where(owner: current_user)

    user_interests = policy_scope(Interest).where(user: current_user)
    @interests = []
    user_interests.each do |interest|
      @interests << interest.activity
    end

    user_bookings = policy_scope(Booking).where(user: current_user)
    @future_bookings = []
    @past_bookings = []
    user_bookings.each do |booking|
      if booking.activity.time > Time.now
        @future_bookings << booking.activity
      else
        @past_bookings << booking
      end
    end
  end


  def dashboard_owner
    @user_activities = policy_scope(Activity).where(owner: current_user)

    @future_activities = []
    @past_activities = []
    @user_activities.each do |activity|
      if activity.time > Time.now
        @future_activities << activity
      else
        @past_activities << activity
      end
    end

    @specialty = []
    @user_activities.each do |activity|
      @specialty << activity.owner.physical_activity
    end
  end

  def show_profile

  end
end

# To add avatar of organiser
# >>  @top_category1.activities.first.photo_user
