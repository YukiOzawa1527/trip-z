class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id,uniquness: {scope: :post_id}
end
