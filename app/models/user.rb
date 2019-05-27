class User < ApplicationRecord
  has_many :bookings,  :interests, :activities

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :age, presence: true
  validates_with :professional, presence: true, default: false, fields: [:first_name, :last_name]

end


