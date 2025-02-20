class Picture < ApplicationRecord
  belongs_to :post
  belongs_to :map, optional: true

  has_one_attached :image

end
