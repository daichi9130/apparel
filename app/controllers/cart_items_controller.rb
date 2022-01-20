class CartItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    if customer_signed_in?
      @cart_items = current_customer.cart_items
      @total = @cart_items.includes(:item).sum('items.price * cart_items.quantity')
      @total = (@total * 1.1).floor
    else
      redirect_to new_customer_session_path
    end
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    # @cart_items = current_customer.cart_items.all
    # @cart_items.each do |cart_item|
    #   if cart_item.item_id == @cart_item.item_id
    #     new_quantity = cart_item.quantity + @cart_item.quantity
    #     cart_item.update_attribute(:quantity, new_quantity)
    #     @cart_item.delete
    #   end
    # end
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(@cart_item.item_id)
      render template: "items/show"
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_items_params)
    @cart_item = CartItem.find(params[:id])
    @total = current_customer.cart_items.includes(:item).sum('items.price * cart_items.quantity')
    @total = (@total * 1.1).floor.to_s(:delimited)
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
     params.require(:cart_item).permit(:size, :quantity, :item_id,)
  end

end
