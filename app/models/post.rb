class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :item, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :description, presence: true
  validates :item_name, presence: true
  validates :rate, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
    end
    
    def self.looks(search, word)
    if search == "perfect_match"
      where("description LIKE ?", "#{word}")
    elsif search == "forward_match"
      where("description LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("description LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("description LIKE ?", "%#{word}%")
    else
      @posts = Post.all
    end
    end
end