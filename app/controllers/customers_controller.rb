class CustomersController < ApplicationController

  def show
    @customers = Customer.all
    @orders = Order.all
    @shippings = current_customer.shippings.all
  end
end
