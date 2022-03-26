class Customer::CartItemsController < ApplicationController
  before_action:authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.update(cart_item_params)
    redirect_to customer_cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    if !CartItem.find_by(item_id: @cart_item.item.id).nil?
      new_cart_item = CartItem.find_by(item_id: @cart_item.item.id)
      new_cart_item.quantity += @cart_item.quantity.to_i
      new_cart_item.save
      redirect_to customer_cart_items_path
    else
      @cart_item.save
      redirect_to customer_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to customer_cart_items_path
  end

  def all_destroy
    cart_items = CartItem.where(customer_id: current_customer)
    cart_items.destroy_all
    redirect_to customer_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
