class ItemsController < ApplicationController
  def index
    @items = Item.where(genre: params[:genre])
  end

  def show
    @item = Item.find(params[:id])
  end
end
