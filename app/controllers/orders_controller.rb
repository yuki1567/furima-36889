class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
  end

  def create
  end

end
