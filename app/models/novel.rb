class Novel < ApplicationRecord

  # Validation

  with_options presence: true do
    validates :title
    validates :content
  end

  # Association
  has_many :novel_comments, dependent: :destroy
  has_many :novel_likes
  has_many :novel_tag_relations
  has_many :novel_tags, through: :novel_tag_relations
  has_many_attached :images
  has_rich_text :content
  belongs_to :user

  def liked?(user)
    novel_likes.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    if search != ""
      @novel = Novel.where('title LIKE(?)', "%#{search}%")
    else
      @novel = Novel.all
    end
  end
end
