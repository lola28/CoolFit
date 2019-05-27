class PagesController < ApplicationController
  # skip_before_action :authenticate_user!

  def home
    @categories = Categories.All
  end
end
