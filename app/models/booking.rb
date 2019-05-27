class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :ratings, default: nil
end
