class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  def index
    @item_order =  ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
     if @item_order.valid?
       pay_item
       @item_order.save
       redirect_to root_path
     else
       render 'index'
     end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture, :building,:city, :address, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if current_user == @item.user
      redirect_to root_path
    end
    if item.order == nil
      redirect_to root_path
    end
  end
end
