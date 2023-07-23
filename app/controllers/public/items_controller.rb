class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @selected_genre = Genre.find_by(id: params[:genre_id])
    #if @selected_genre.present?
    #  @items = @selected_genre.items
    #else
    #  @items = Item.all
    #end
    if @selected_genre.present?
      keyword = @selected_genre.name
    elsif params[:keyword].present?
      keyword = params[:keyword]
    else
      keyword = 'キャンプ道具'
    end
    #keyword = @selected_genre.present? ? @selected_genre.name : 'キャンプ道具'
    #byebug
    @items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  def show
    @item = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
    @post = Post.new

  end
end


