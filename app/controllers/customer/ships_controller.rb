class Customer::ShipsController < ApplicationController
  def index
    @ship = Ship.new
    @customer = current_customer
    @ships = @customer.ships.all
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.customer_id = current_customer.id
    if @ship.save
       flash[:notice] = "新しい配送先を登録しました"
       redirect_to customer_ships_path
    else
      @customer = current_customer
      @ships = @customer.ships.all
      render index
    end  
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
    if @ship.destroy
      flash[:notice] = "1件の配送先を削除しました"
      redirect_to edit_customer_ship_path(ships.id)
    end  
  end

  def edit
    @ship = Ship.find(params[:id])
    if @ship.customer != current_customer
       redirect_to edit_customer_ship_path(ship.id)
    end   
  end

  def update
    @ship = Ship.find(params[:id])
    if @ship.update(book_params)
       flash[:notice]="配送先住所の更新ができました"
       redirect_to edit_customer_ship_path(ship.id)
    else
       render :edit
    end
  end  


  private

  def ship_params
    params.require(:ship).permit(:name, :post, :address)
  end
end
