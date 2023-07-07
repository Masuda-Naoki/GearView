class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @selected_genre = Genre.find_by(id: params[:genre_id])
  
    if @selected_genre.present?
      @items = @selected_genre.items
    else
      @items = Item.all
    end
  
    keyword = @selected_genre.present? ? @selected_genre.name : 'キャンプ道具'
    @items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  def show
    @item = RakutenWebService::Ichiba::Item.search(itemCode: params[:id]).first
  end
end

