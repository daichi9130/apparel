class CartItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      puts "失敗"
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_items_params
     params.require(:cart_item).permit(:size, :quantity, :item_id,)
  end

end
