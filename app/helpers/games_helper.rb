module GamesHelper
  def merge_params(new_params)
    params.permit(:genre, :discount_over, :months_ago, :query, :order_by).merge(new_params)
  end

  def formatted_price(game)
    game.free? ? 'FREE' : number_to_currency(game.sale_price, unit: 'C$')
  end
end
