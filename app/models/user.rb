class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :bookings
  has_many :interests
  has_many :activities

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :age, presence: true

end



  validates :first_name, presence: true
  validates :last_name, presence: true
end


