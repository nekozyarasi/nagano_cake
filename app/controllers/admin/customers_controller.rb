class Admin::CustomersController < ApplicationController
  def index
  end

  def show
    @customer = Customer.find(params[:id])
    # @owner = @customer.
    
    # @user = User.find(params[:id])
    # @books = @user.books
  end

  def edit
  end

  def update
  end
end
