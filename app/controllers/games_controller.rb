class GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(16)

    filter_params(params).each do |key, value|
      @games = @games.public_send(key, value) if value.present?
    end

    @page_title = 'Games'
  end

  def show
    @game = Game.find_by!(slug: params[:id])
  end

  private

  def filter_params(params)
    params.slice(:genre, :discount_over, :months_ago, :query, :order_by)
  end
end
