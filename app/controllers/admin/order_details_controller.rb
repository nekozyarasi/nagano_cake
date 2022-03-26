class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    if @order.order_details.find_by(production_status: 2).present?
      @order.update(order_status: 2)
    end
    if @order.order_details.where(production_status: 3).count == @order.order_details.count
      @order.update(order_status: 3)
    end
    # @order_detail.update(order_detail_params)
    # @order = @order_detail.order
    # redirect_to admin_order_path
    # @order_detail = OrderDetail.find(params[:id])
    # @order_detail.update(order_detail_params)
    # @order = @order_detail.order
    # if @order.order_details.find_by(production_status: 2).present?
    #   @order.update(order_status: 2)
    # end
    # if @order.order_details.where(production_status: 3).count == @order.order_details.count
    #   @order.update(order_status: 3)
    # end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
