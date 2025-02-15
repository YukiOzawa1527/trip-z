class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.string :name, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false

    end
  end
end
