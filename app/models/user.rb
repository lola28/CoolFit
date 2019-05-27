class User < ApplicationRecord
  has_many :bookings,  :interests, :activities

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :age, presence: true
  validates_with :professional, presence: true, default: false, fields: [:first_name, :last_name]

end


# reate_table "users", force: :cascade do |t|
#     t.string "username"
#     t.string "email"
#     t.string "encrypted_password"
#     t.integer "age"
#     t.string "physical_activity"
#     t.text "description"
#     t.boolean "professional"
#     t.string "first_name"
#     t.string "last_name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
