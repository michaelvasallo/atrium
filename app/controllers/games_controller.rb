class GamesController < ApplicationController
  def index
    if params[:genre] && genre = Genre.where("lower(name) = ?", params[:genre].downcase).first
      @games = genre.games
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
