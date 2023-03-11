class Illust < ApplicationRecord
  # Validation

  with_options presence: true do
    validates :images
    validates :title
    validates :description
    validates :application
  end
  validate :images_content_type, if: :images_was_attached?
  
  # Association

  has_many :illust_comments, dependent: :destroy
  has_many :illust_likes, dependent: :destroy
  has_many :illust_tag_relations
  has_many :illust_tags, through: :illust_tag_relations
  has_many_attached :images

  belongs_to :user

  private

  # 画像の拡張子判定
  def images_content_type
    images.each do |image|
      extension = ['image/png', 'image/jpg', 'image/jpeg']
      errors.add(:images, "の拡張子が間違っています") unless image.content_type.in?(extension)
    end
  end

  def images_was_attached?
    self.images.attached?
  end

  # 検索結果の分岐
  def self.search(search)
    if search != ""
      @illust = Illust.where('title LIKE(?)', "%#{search}%")
    else
      @illust = Illust.all
    end
  end

end
