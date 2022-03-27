class Customer::ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def about
  end

  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
