class Comment < ApplicationRecord
  belongs_to :customer  #Comment.customerでコメントの所有者を取得
  belongs_to :post  #Comment.postでそのコメントがされた投稿を取得
end
