class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :authenticate_user!, except: [:index]
  def index
    
  end
  
  

  def create
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
  end

end
