# booking_mailer_preview.rb
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def create_confirmation
    user = User.first
    booking = Booking.last

    BookingMailer.with(user: user, booking: booking).create_confirmation
    # UserMailer.welcome.with(user: User.first) #=>
    # UserMailer.with(user: User.first).welcome #=>
  end

end
