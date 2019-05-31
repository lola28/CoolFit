class AddCurrentCapacityToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :current_capacity, :integer
  end
end
