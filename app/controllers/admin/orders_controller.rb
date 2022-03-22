class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @order_counts = a
  end

  def show
  end

  def update
  end
end
