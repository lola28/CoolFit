class RemoveCurrentCapacityFromActivity < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :current_capacity, :integer
  end
end
