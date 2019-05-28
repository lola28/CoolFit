class Health < ApplicationRecord
  has_many :health_relations
  has_many :activities, through: :health_relations
  validates :description, presence: true
end
