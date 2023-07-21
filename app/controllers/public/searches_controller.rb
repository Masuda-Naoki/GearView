class Public::SearchesController < ApplicationController
   before_action :authenticate_customer!

  def search
    @word = params[:word]
   @posts = Post.looks(params[:search], params[:word])
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
