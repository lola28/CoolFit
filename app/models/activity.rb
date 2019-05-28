class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :interests, through: :users
  has_many :bookings, through: :users

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :price, default: nil
  validates :description, presence: true
  validates :photo_db, presence: true, unless: :photo_user?
  validates :photo_user, presence: true, unless: :photo_db?

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
  }

end
