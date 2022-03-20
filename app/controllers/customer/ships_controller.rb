class Customer::ShipsController < ApplicationController
  def index
    @address = Adress.new
    @customer = current_customer
    @address = @customer.address.all
  end

  def create
    @address = Adress.new(ship_params)
    @address.customer_id = current_customer.id
    if @address.save
       flash[:notice] = "新しい配送先を登録しました"
       redirect_to customer_ships_path
    else
      @customer = current_customer
      @addresses = @customer.ships.all
      render index
    end  
  end

  def destroy
    ship = Address.find(params[:id])
    ship.destroy
    if @address.destroy
      flash[:notice] = "1件の配送先を削除しました"
      redirect_to edit_customer_ship_path(ships.id)
    end  
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer != current_customer
       redirect_to edit_customer_ship_path(ship.id)
    end   
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(book_params)
       flash[:notice]="配送先住所の更新ができました"
       redirect_to edit_customer_ship_path(ship.id)
    else
       render :edit
    end
  end  


  private

  def ship_params
    params.require(:address).permit(:name, :post, :address)
  end
end
