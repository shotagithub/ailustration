class ProductComment < ApplicationRecord
  # Validation
  validates :text, presence: true
  # Association
  belongs_to :user
  belongs_to :product
end
