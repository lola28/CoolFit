class AddLatToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :lat, :float
  end
end
