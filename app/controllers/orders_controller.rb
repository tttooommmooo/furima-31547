class OrdersController < ApplicationController
  before_action :set_item
  
  def index
    @order_address = OrderAddress.new  
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
 
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user: current_user.id, item: params[:item_id])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end


end
