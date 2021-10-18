class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
    unless current_user.card.present?
      flash[:notice] = "⚠️クレジットカードの登録をしてください"
      redirect_to item_path(@item)
    end
    @order_address = OrderAddress.new
    @card = Card.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path 
    else
      render :index 
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :street_address, :detail_address, :telephone).merge(
      item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
  end
end
