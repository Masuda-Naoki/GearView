class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy


  def increment_likes_count
    self.increment!(:likes_count)
  end

  def decrement_likes_count
    self.decrement!(:likes_count)
  end

  def increment_comments_count
    self.increment!(:comments_count)
  end

  def decrement_comments_count
    self.decrement!(:comments_count)
  end

  def increment_reviews_count
    self.increment!(:reviews_count)
  end

  def decrement_reviews_count
    self.decrement!(:reviews_count)
  end
end
