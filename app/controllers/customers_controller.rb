class CustomersController < ApplicationController

  def show
    @shippings = current_customer.shippings.all
  end
end
