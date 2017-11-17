class CartsController < ApplicationController
  def index
    @games = Game.where(slug: session[:cart])
  end

  def create
    session[:cart] << params[:game] unless session[:cart].include? params[:game]
  end

  def delete
    session[:cart].delete params[:game]
  end
end
