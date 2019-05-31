class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :interests
  has_many :activities

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  mount_uploader :avatar, PhotoUploader

  def average_owner_rating
    ratings = activities.map(&:bookings).flatten.map(&:rating)
    if ratings.empty?
      0
    else
      ratings.sum / ratings.size
    end
  end

  def star_to_5
    star = 5 - average_owner_rating
  end

  def name
    if first_name.nil?
      return last_name
    elsif last_name.nil?
      return first_name
    else
      return first_name + last_name
    end
  end
end
