class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
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
    redirect_to admins_item_path
  end

  def update
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
