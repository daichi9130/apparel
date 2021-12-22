class OrdersController < ApplicationController
  def new
    @order = Order.new
    @shippings = current_customer.shippings
  end

  def create
    @cart_items = current_customer.cart_items.all
    @totals = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price(true) } + 500
    @order = current_customer.orders.new(order_params)
    @order.amount = @totals
    @order.save
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item.id
        order_detail.order_id = @order.id
        order_detail.order_quantity = cart_item.quantity
        order_detail.save
      end
    redirect_to orders_complete_path
    @cart_items.destroy_all
  end

  def confirm
    if params[:order][:address].blank?
      redirect_to new_order_path
      return
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price(true) }
    @totals = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price(true) } + 500
    @shipping = Shipping.find(params[:order][:address])
    @payment = params[:order][:payment]
    @postage = 500
  end

  def confirm_get
    redirect_to cart_items_path
  end
  def complete
  end

  private

  def order_params
    #params.require(:order).permit(:shipping_id, :payment, :postage, :customer_id, :cart_item_id).merge(customer_id: current_customer.id)
    params.permit(:shipping_id, :payment, :customer_id, :cart_item_id).merge(customer_id: current_customer.id)
 end
end
