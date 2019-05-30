class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :interests, through: :users
  has_many :bookings, dependent: :destroy
  has_many :health_relations, dependent: :destroy
  has_many :healths, through: :health_relations
  has_many :messages

  validates :name, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :duration, presence: true
  validates :price, default: nil
  validates :description, presence: true
  # validates :photo_db, presence: true, unless: :photo_user?
  # validates :photo_user, presence: true, unless: :photo_db?

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

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
