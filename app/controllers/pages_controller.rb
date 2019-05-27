class PagesController < ApplicationController
  def home
    @categories = Categories.All
  end
end
