class Public::CommentsController < ApplicationController
  
def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.customer = current_customer
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
