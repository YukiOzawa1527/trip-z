class Picture < ApplicationRecord
  belongs_to :post
  belongs_to :map
end
