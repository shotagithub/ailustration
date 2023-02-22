class Order < ApplicationRecord
  # validation
  validates :token, presence: true

  # Association
  belongs_to :user
  belongs_to :product
end
