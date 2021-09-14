class ItemsController < ApplicationController
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
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
