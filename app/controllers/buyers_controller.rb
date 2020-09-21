class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item only: [:index,:create]
  
  def index
    @buyer = BuyerBuyeraddress.new
  end

  def create
    @buyer = BuyerBuyeraddress.new(buyer_params)
    if @buyer.valid?
      @buyer.save
      redirect_to root_path
   else
     render :index
   end
  end

  private

  def buyer_params
    params.permit(:token, :postal_code, :prefecture, :city, :house_number, :building_name, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
