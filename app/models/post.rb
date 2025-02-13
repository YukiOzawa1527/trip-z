class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }

  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
