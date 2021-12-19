class CustomersController < ApplicationController

  def show
    @customers = Customer.all
    @orders = Order.all
    @shippings = current_customer.shippings.all
  end

  def item
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find_by(order_id: params[:order_id])
  end
end
