class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    # @user = current_user
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end


  def welcome_pro
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'You are a pro')
  end

end
