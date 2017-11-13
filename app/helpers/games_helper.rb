module GamesHelper
  def merge_params(new_params)
    params.permit(:genre, :discount_over, :months_ago, :query, :order_by).merge(new_params)
  end
end
