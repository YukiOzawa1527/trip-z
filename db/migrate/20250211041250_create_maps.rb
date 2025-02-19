class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.decimal :latitude
      t.decimal :longitude
    end
  end
end
