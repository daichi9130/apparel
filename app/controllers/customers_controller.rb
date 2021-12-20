class CustomersController < ApplicationController

  def show
    @customers = Customer.all
    @orders = Order.all
    @shippings = current_customer.shippings.all
  end

  def item
    @order = Order.find(params[:order_id])
    @order_details = OrderDetail.where(order_id: params[:order_id])
  end

end
