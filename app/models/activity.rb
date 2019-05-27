class Activity < ApplicationRecord
  belongs_to :category
  has_many :interests, through: :users
  has_many :bookings, through: :users

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :price, presence: true, default: nil
  validates :description, presence: true
  validates :photo_db, presence: true, unless: :photo_user?
  validates :photo_user, presence: true, unless: :photo_db?
end
