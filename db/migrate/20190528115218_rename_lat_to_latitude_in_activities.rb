class RenameLatToLatitudeInActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :lat, :latitude
  end
end
