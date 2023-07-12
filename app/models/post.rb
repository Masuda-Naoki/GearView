class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :item, optional: true
  has_one_attached :image
end