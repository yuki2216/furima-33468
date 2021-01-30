class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  # before_action :authenticate_user!, except: [:index]
  def index
  end

end
