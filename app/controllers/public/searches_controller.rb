class Public::SearchesController < ApplicationController
   before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end

  def search_tag
    @word = params[:word]
    unless @word == ""
      @tag = Tag.find_by(tag_name: @word)
      @posts = @tag.posts
    else
      @posts = Post.all
    end
  end
end
