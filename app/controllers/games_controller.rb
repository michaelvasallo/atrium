class GamesController < ApplicationController
  def index
    @games = Game.filter_by_genre(params[:genre])
  end

  def show
    @game = Game.find(params[:id])
  end
end
