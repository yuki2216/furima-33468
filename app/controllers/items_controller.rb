class ItemsController < ApplicationController
  
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_id, only: [:show, :edit, :update]
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
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :image, :description, :category_id, :condition_id, :shipping_user_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
  
  def item_id
    @item = Item.find(params[:id])
  end
end
