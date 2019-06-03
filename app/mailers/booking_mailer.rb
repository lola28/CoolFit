# booking_mailer.rb
class BookingMailer < ApplicationMailer

    def create_confirmation
      @user = params[:user]
      @booking = params[:booking]

      mail(
        to:       @user.email,
        subject:  "Booking: #{@booking.activity.name}"
      )
  end
end
