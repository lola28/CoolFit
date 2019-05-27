class Category < ApplicationRecord
  has_many :activities

  validates :description, presence: true
end
