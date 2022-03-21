class Customer::ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def about
  end

  def index
    @items = Item.all
  end

  def show
  end
end
