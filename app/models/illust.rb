class Illust < ApplicationRecord
  # Validation

  with_options presence: true do
    validates :images
    validates :title
    validates :description
    validates :application
  end
  
  # Association

  has_many :illust_comments
  has_many :illust_likes
  has_many :illust_tag_relations
  has_many :illust_tags, through: :illust_tag_relations
  has_many_attached :images

  belongs_to :user
end
