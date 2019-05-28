class AddLogotoHealths < ActiveRecord::Migration[5.2]
  def change
    add_column :healths, :logo, :string
  end
end
