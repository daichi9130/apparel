class OrdersController < ApplicationController
  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.order.new(order_params)
  end

  def update

  end

  def confirm
    if params[:order][:address].blank?
      redirect_to new_order_path
      return
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @totals = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price } + 500
    @shipping = Shipping.find(params[:order][:address])
    @payment = params[:order][:payment]
    @postage = 500
  end

  def confirm_get
    redirect_to root_path
  end
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:address, :post_code, :receiver, :customer_id).merge(customer_id: current_customer.id)
  end

  def cart_item_params
    params.require(:order).permit(:address, :post_code, :recipient_name)
  end
end
