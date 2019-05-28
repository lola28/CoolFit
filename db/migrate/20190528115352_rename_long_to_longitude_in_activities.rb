class RenameLongToLongitudeInActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :long, :longitude
  end
end
