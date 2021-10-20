class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
    if current_user.card.present?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      card = Card.find_by(user_id: current_user.id)
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
    end
  end
end
