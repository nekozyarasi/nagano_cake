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
  end
end
