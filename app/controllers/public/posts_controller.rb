class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
    @post.customer_id = current_customer.id
  end
  
  def index
    if params[:order] == 'newest'
      @posts = Post.order(created_at: :desc)
    elsif params[:order] == 'popular'
      @posts = Post.order(rate: :desc)
    else
      @posts = Post.all
    end
  end

  def show
  @post = Post.find(params[:id])
  @comment = Comment.new
  end


def create
  @post = Post.new(post_params)
  @post.customer_id = current_customer.id
  @post.rate = params[:score]
  @post.item_id = 1 # dummy
  
  if @post.save
    redirect_to posts_path
  else
    render :new
  end
end





  def edit
    @post = current_customer.posts.find(params[:id])
  end

  def update
    @post = current_customer.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿が更新されました。'
    else
      render :edit
    end
  end

  def destroy
 @post = current_customer.posts.find(params[:id])
  @post.destroy
  redirect_to posts_path, notice: '投稿が削除されました。'
  end

  private

def post_params
  params.require(:post).permit(:description, :item_id, :customer_id, :rate, :item_name, :image)
end
end