class Admin::OrdersController < ApplicationController
  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
    # @total = @order_details.inject(0) { |sum, item| sum + sub_total }
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
