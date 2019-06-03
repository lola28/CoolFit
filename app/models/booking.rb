class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :ratings, default: nil

private

  def send_confirmation_email
    BookingMailer.with(user: self).create_confirmation.deliver_now
  end
end
