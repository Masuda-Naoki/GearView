class Item < ApplicationRecord
  
  belongs_to :genre
  
  validates :name, presence: true
  validates :description, presence: true
end
