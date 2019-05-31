class AddMaxCapacityToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :max_capacity, :integer
  end
end
