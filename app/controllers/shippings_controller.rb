class ShippingsController < ApplicationController
  def new
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.save
    redirect_to customer_path(current_customer)
  end

  def destroy
  end

  private

  def shipping_params
     params.require(:shipping).permit(:recipient_name, :postal_code, :address).merge(customer_id: current_customer.id)
  end
end
