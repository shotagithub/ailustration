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
  validate :file_content_type, if: :was_attached?

  # Association
  has_many           :product_comments
  has_many           :product_likes
  has_many           :product_tag_relations
  has_many           :product_tags, through: :product_tag_relations
  has_many_attached  :images

  has_one            :order
  has_one_attached   :file
  
  belongs_to         :user

  private
  def file_content_type
    extension = 'application/zip'
    errors.add(:file, "の拡張子が間違っています") unless file.content_type.in?(extension)
  end

  def was_attached?
    self.file.attached?
  end
end
