class Picture < ApplicationRecord
  belongs_to :post
  belongs_to :map

  has_one_attached :image
end
