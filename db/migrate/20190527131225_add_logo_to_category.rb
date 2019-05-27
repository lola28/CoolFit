class AddLogoToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :logo, :string
  end
end
