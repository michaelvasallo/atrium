class CartsController < ApplicationController
  def index
    calculate_totals
  end

  def create
    session[:cart] << params[:game] unless session[:cart].include? params[:game]
  end

  def destroy
    @cart_item_id = params[:game]
    session[:cart].delete @cart_item_id

    calculate_totals
  end

  private

  def calculate_totals
    @games = Game.where(slug: session[:cart])
    @sub_total = @games.map(&:sale_price).reduce(:+)
  end
end
