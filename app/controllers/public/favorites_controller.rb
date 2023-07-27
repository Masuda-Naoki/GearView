class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer! # ログインしていない場合はログイン画面にリダイレクトする

  def create
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: post.id)

    if favorite.save
      redirect_to post_path(post), notice: 'いいねしました。'
    else
      redirect_to post_path(post), alert: 'いいねに失敗しました。'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)

    if favorite.destroy
      redirect_to post_path(post), notice: 'いいねを解除しました。'
    else
      redirect_to post_path(post), alert: 'いいねの解除に失敗しました。'
    end
  end
end
