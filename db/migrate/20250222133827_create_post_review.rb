class CreatePostReview < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reviews do |t|
      t.float :star
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
