class ItemsController < ApplicationController
  
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:title, :user, :image, :description, :category_id, :condition_id, :shipping_user_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
