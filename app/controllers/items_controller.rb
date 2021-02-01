class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :authenticate_user!, except: [:index]
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:title, :user, :description, :category_id, :condition_id, :shipping_user_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
