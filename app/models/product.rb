class Product < ApplicationRecord

  # Validation
  with_options presence: true do
    validates :images
    validates :file
    validates :title
    validates :description
    validates :application
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 99999 }
  end
  validate :file_content_type, if: :file_was_attached?
  validate :images_content_type, if: :images_was_attached?


  # Association
  has_many           :product_comments, dependent: :destroy
  has_many           :product_likes
  has_many           :product_tag_relations
  has_many           :product_tags, through: :product_tag_relations
  has_many_attached  :images

  has_one            :order
  has_one_attached   :file
  
  belongs_to         :user
  belongs_to         :cart

  def liked?(user)
    product_likes.where(user_id: user.id).exists?
  end

  private
  # ファイルの拡張子判定
  def file_content_type
    extension = 'application/zip'
    errors.add(:file, "の拡張子が間違っています") unless file.content_type.in?(extension)
  end

  def file_was_attached?
    self.file.attached?
  end

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
      @product = Product.where('title LIKE(?)', "%#{search}%")
    else
      @product = Product.all
    end
  end
end
