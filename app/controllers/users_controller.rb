class UsersController < ApplicationController
  # after_create :set_default_avatar

  # def set_default_avatar
    # self.avatar = "Coolfit/blank-avatar1_demquh.png"
  # end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
  end
end
