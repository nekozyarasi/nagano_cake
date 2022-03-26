class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def log
  end
  
  def confirm
    @order = Order.new(order_params)
    #new画面から渡ってきたデータ @orderに入れます
    if params[:order][:address_number] == "0"
        #viewで定義しているaddress_numberが"0"だったときにこの処理を実行します
        #form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
      # @address = Address.find(params[:order][:address_id])
      @order.post = current_customer.post
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.family_name
    elsif params[:order][:address_number] == "1"
      #view で定義しているaddress_number が"1"だったときにこの処理を実行します
      if Ships.exists?(id: params[:order][:ship_id])
        #registered は viweで定義しています
        @order.post = Addresses.find(params[:order][:address_id]).post
        @order.name = Addresses.find(params[:order][:address_id]).name
        @order.address = Addresses.find(params[:order][:address_id]).address
      else
        render :new
        #既存のデータを使っておりありえないですが、万が一データが足りない場合は new を render します
      end
    elsif params[:order][:address_number] == "2"
      #viewで定義している address_numberが"2"だったときにこの処理を実行します
      ships_new = current_customer.ships.new(ships_params)
      if ships_new.save # 確定前(確認画面)で save してしまうことになります
      else
        render :new
        #ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合はnewに戻します
      end
    end

    @postage = 800
    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
    @total = 0 #変数提議　合計を計算する変数
    @cart_items.each do |cart_item|
      @total += cart_item.item.with_tax_price*cart_item.quantity
    end
    @total_due = @total + @postage

    @order.total_due = @total_due
    @order.order_status = 0
    # @total = @cart_items.inject(0) { |sum, item| sum + item.total_amount }
    # 合計金額を出す処理です sum_price はモデルで定義したメソッドです
  end

  
    

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800

    if @order.save
        @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_items = @order.order_items.new
          @order_items.item_id = cart_item.item.id
          @order_items.item.name = cart_item.item.name
          @order_items.tex_excluded = cart_item.item.with_tax_price
          @order_items.quantity = cart_item.quantity
          @order_items.save
        end
       @cart_items.destroy_all
      redirect_to customer_complete_path
    end
  end

  def complete
  end

  def index
     @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id]) #order特定
    @order_item = @order.order_items #特定したorserからorder_items全部取得
    @total = 0 #変数提議　合計を計算する変数
  end
end

private
  def order_params
    params.require(:order).permit(:payment, :name, :address, :postage, :post, :item_id, :total_due, :quantity, :order_status)
  end
  
  def ship_params
    params.require(:order).permit(:post, :address, :name)
  end