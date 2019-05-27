class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.integer :age
      t.string :physical_activity
      t.text :description
      t.boolean :professional
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
