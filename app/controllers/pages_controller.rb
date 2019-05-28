class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

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
end

# To add avatar of organiser
# >>  @top_category1.activities.first.photo_user

