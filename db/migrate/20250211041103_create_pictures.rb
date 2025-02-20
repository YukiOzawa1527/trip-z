class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|

      t.timestamps
      t.integer :post_id, null: false
      t.integer :map_id
      
    end
  end
end
