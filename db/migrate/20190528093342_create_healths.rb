class CreateHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :healths do |t|
      t.text :description

      t.timestamps
    end
  end
end
