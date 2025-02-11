class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :maps, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :pictures, through: :posts

  #自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationships", foreign_key: "followed_id", dependent: :destroy
  #被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  #自分がフォローする側の関係性
  has_many :relationships, class_name: "Reationships", foreign_key: "follower_id", dependent: :destroy
  #与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  #以下イマイチ分かっていないが必要そうなので追加してある状況（要確認）
  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end


end
