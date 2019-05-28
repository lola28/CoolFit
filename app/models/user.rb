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
  validates :age, presence: true



  validates :first_name, presence: true
  validates :last_name, presence: true


  def average_owner_rating
    # ratings of this specific user
    # self.bookings.map(&:rating)

    ratings = activities.map(&:bookings).flatten.map(&:rating)
    ratings.sum / ratings.size

    # ....
  end

  def my_ratings
    ratings = bookings.map(&:rating)
    ratings.sum / ratings.size
  end

end


