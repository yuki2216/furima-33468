class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :user, :description, :category_id, :condition_id, :shipping_user_id, :shipping_area_id, :shipping_day_id, :price)
  end

end
