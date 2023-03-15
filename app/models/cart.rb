class Cart < ApplicationRecord
  # validation


  # Association
  has_many   :products

  belongs_to :user
end
