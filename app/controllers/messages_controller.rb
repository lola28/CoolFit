class MessagesController < ApplicationController
  before_action :set_activity

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.activity = @activity
    @message.owner = current_user


    authorize @message
    if @message.save
      respond_to do |format|
        format.html { redirect_to activity_path(@activity) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'activities/show' }
        format.js
      end
    end
  end

  private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
