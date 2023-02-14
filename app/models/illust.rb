class Illust < ApplicationRecord
  # Association

  has_many :illust_comments
  has_many :illust_likes
  has_many :illust_tag_relations
  has_many :illust_tags, through: :illust_tag_relations
  has_many_attached :images
  belongs_to :user
end
