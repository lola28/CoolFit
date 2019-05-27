class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :fitness_level
      t.string :location
      t.datetime :time
      t.integer :duration
      t.integer :price
      t.text :description
      t.references :category, foreign_key: true
      t.string :photo_db
      t.string :photo_user

      t.timestamps
    end
  end
end
