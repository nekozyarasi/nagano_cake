class Customer::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
       flash[:notice] = "新しい配送先を登録しました"
       redirect_to request.referer
    else
      @customer = current_customer
      @addresses = @customer.address.all
      render :index
    end  
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "1件の配送先を削除しました"
      redirect_to customer_addresses_path
    end  
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer != current_customer
       redirect_to customer_addresses_path
    end   
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       flash[:notice]="配送先住所の更新ができました"
       redirect_to customer_addresses_path
    else
       render :edit
    end
  end  


  private

  def address_params
    params.require(:address).permit(:name, :post, :address)
  end
end

