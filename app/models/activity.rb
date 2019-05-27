class Activity < ApplicationRecord
  belongs_to :category
  has_many :interests, through: :users
  has_many :bookings, through: :users

  validates :location, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :price, presence: true, default: 0
  validates :description, presence: true
  validates :photo_db, presence: true, unless: :photo_user?
  validates :photo_user, presence: true, unless: :photo_db?


  # def expiration_date_cannot_be_in_the_past
  #   if expiration.date.present? && expiration_date < Date.today
  #     errors.add(:expiration_date, "can't be in the past!")
  #   end
  # end
end

