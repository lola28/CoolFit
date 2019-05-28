class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.activity = @activity
  end


  private
  def message_params
    prams.require(:message).permit(:content)
  end
end
