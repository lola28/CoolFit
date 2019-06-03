class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :ratings, default: nil

  #after_create :send_confirmation_email

private

  def send_confirmation_email
    # BookingMailer.with(user: self.user, booking:self).create_confirmation.deliver_now
  end
end
