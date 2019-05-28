class HealthRelation < ApplicationRecord
  belongs_to :activity
  belongs_to :health
end
