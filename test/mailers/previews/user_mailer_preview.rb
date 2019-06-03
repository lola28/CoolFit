# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first

    UserMailer.with(user: user).welcome
    # UserMailer.welcome.with(user: User.first) #=>
    # UserMailer.with(user: User.first).welcome #=>
  end

  def welcome_pro
    user = User.where(professional: true).last

    UserMailer.with(user:user).welcome_pro
  end

end
