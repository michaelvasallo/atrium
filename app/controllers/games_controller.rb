class GamesController < ApplicationController
  def index
    @games = Game.all

    filtering_params(params).each do |key, value|
      @games = @games.public_send(key, value) if value.present?
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def filtering_params(params)
    params.slice(:genre, :discount_over, :months_ago)
  end
end
