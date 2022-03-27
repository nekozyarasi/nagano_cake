class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def log
    @order = Order.new(order_params)
    @postage = 800
    @cart_items = current_customer.cart_items.all
    # 合計金額を表す
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # 送料込み請求金額を表す
    @total_due = @total + @postage
    # 配送先の選択肢分岐
    if params[:order][:order_addresses] == '0'
     @order.post = current_customer.post
     @order.address = current_customer.address
     @order.name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:order_addresses] == '1'
     if Address.exists?(id: params[:order][:address_id])
       @order.name =Address.find(params[:order][:address_id]).name
       @order.address =Address.find(params[:order][:address_id]).address
       @order.post =Address.find(params[:order][:address_id]).post
     else
       flash.now[:notice] = '配送先が登録されていません'
       render 'new'
     end
    elsif params[:order][:order_addresses] == '2' && @order.post? && @order.address? && @order.name?
    else
     flash.now[:notice] = '未選択の選択肢があります'
     render 'new'
    end
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
       # 注文詳細に保存
       @cart_items.each do |cart|
         order_detail = OrderDetail.new
         order_detail.item_id = cart.item_id
         order_detail.order_id = @order.id
         order_detail.quantity = cart.quantity
         order_detail.price = cart.item.add_tax_price
         order_detail.save
       end
       # カート内商品を空にする
       current_customer.cart_items.destroy_all
       redirect_to customer_orders_thanks_path
    else
       @order = Order.new(order_params)
       render 'new'
    end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_due, :payment, :post, :address, :name, :postage)
  end

end

