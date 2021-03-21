class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation
  before_action :sold_out
  
  def index
    @order_address = OrderAddress.new  
  end 

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
 
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user: current_user.id, item: params[:item_id], token: params[:token])
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user
  end
  
  def sold_out
    redirect_to root_path if @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
