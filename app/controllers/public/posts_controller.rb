class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.new
  end
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


def create
  @post = current_customer.posts.build(post_params)
  if @post.save
    redirect_to post_path(@post), notice: '投稿が作成されました。'
  else
 render :index
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
  params.require(:post).permit(:description, :item_id, :customer_id, :rate)
end
end