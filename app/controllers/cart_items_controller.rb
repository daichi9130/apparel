class CartItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def index
    if customer_signed_in?
      @cart_items = current_customer.cart_items
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    else
      redirect_to new_customer_session_path
    end
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
