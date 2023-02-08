class OrdersController < ApplicationController
  before_action :set_index, only: [:new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :order_confirmation, only: [:new, :create]

  def index
    
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_index
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def order_confirmation
    redirect_to root_path unless @item.order.nil?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

end
