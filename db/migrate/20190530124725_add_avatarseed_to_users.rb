class AddAvatarseedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatarseed, :string
  end
end
