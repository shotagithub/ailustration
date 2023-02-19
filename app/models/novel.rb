class Novel < ApplicationRecord

  # Validation

  with_options presence: true do
    validates :title
    validates :content
  end

  # Association
  has_many :novel_comments
  has_many :novel_likes
  has_many :novel_tag_relations
  has_many :novel_tags, through: :novel_tag_relations
  has_many_attached :images
  has_rich_text :content
  belongs_to :user
end
