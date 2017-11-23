class CartsController < ApplicationController
  def index
    load_cart
  end

  def create
    session[:cart] << params[:game] unless session[:cart].include? params[:game]
  end

  def destroy
    @cart_item_id = params[:game]
    session[:cart].delete @cart_item_id

    load_cart
  end

  private

  def load_cart
    @games = Game.where(slug: session[:cart])
    @sub_total = @games.map(&:sale_price).reduce(:+)
  end
end
