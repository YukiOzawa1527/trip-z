class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :active_users, -> { where(is_active: true) }
  scope :reject_users, -> { where(is_active: false) }

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :maps, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :pictures, through: :posts

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 200 }


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


  def active_for_authentication?
    super && (is_active == true)
  end

  def self.search_for(content, method)
    users = self.all
    if content.present?
      case method
      when 'perfect'
        users = users.where(name: content)
      when 'forward'
        users = users.where('name LIKE ?', content + '%')
      when 'backward'
        users = users.where('name LIKE ?', '%' + content)
      when 'partial'
        users = users.where('name LIKE ?', '%' + content + '%')
      end
    end
    users
  end

  def self.guest
    user = User.find_or_initialize_by(email: 'guest@example.com')
    user.assign_attributes(
      name: 'ゲスト太郎',
      phone_number: '030-3333-3333',
      prefecture_id: '5',
      birthday: '2025/1/1',
      introduction: 'ゲストです。',
      is_active: true,
      password: SecureRandom.urlsafe_base64
    )
    user.save
    user
  end
end
