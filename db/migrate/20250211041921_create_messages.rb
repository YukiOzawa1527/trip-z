class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|

      t.timestamps
      t.integer :sender_id, null: false
      t.integer :reciever_id, null: false
      t.text :message, null: false
      
    end
  end
end
