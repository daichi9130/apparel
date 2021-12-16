class OrdersController < ApplicationController
  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.order.new(order_params)

  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:address, :post_code, :receiver).merge(customer_id: current_customer.id)
  end
end
