class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end

  def index
    @items = Item.where(genre: params[:genre])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_item_path(@item.id)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path(@item.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :genre, :image, :price, :sales_status)
  end

end
