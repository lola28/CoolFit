class RemoveBookingFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :messages, :booking, foreign_key: true
  end
end
