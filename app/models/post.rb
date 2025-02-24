class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }

  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true


  has_many :post_comments, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
  belongs_to :user


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    posts = self.all
    if content.present?
      case method
      when 'perfect'
        posts = posts.where(title: content).or(
          posts.where(body: content)
        )
      when 'forward'
        posts = posts.where('title LIKE ?', content + '%').or(
          posts.where('body LIKE ?', content + '%')
        )
      when 'backward'
        posts = posts.where('title LIKE ?', '%' + content).or(
          posts.where('body LIKE ?', '%' + content)
        )
      when 'partial'
        posts = posts.where('title LIKE ?', '%' + content + '%').or(
          posts.where('body LIKE ?', '%' + content + '%')
        )
      end
    end
    posts
  end

  def save_tags(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end

end
