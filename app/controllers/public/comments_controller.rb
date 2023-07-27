class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, only: :create

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if customer_signed_in? # 顧客がログインしている場合のみコメントと関連付ける
      @comment.customer = current_customer
    end

    if @comment.save
      redirect_to @post, notice: 'コメントが投稿されました。'
    else
      render 'public/posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
