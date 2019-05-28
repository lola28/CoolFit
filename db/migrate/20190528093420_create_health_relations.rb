class CreateHealthRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :health_relations do |t|
      t.references :activity, foreign_key: true
      t.references :health, foreign_key: true

      t.timestamps
    end
  end
end
