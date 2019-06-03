# booking_mailer.rb
class BookingMailer < ApplicationMailer

    def create_confirmation
      @user = params[:user]
      @booking = params[:booking]

      mail(
        to:       @user.email,
        subject:  "Your booking for #{@user.bookings.last.activity.name} was created!"
      )
  end
end
