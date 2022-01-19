class ShippingsController < ApplicationController

  def new
    @shipping = Shipping.new
  end

  def create
    @shipping = current_customer.shippings.new(shipping_params)
    if @shipping.save
      redirect_to customer_path(current_customer)
    else
      render :new
    end
  end

  def destroy
    shippings = current_customer.shippings.find(params[:id])
    shippings.destroy
    redirect_to customer_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:recipient_name, :postal_code, :address)
  end

end
