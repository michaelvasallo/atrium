class Cart < ApplicationRecord
  has_many :cart_items

  def add_game(params)
    current_item = cart_items.find_by(game_id: params[:game])

    if current_item.nil?
      new_item = cart_items.create(
        cart_id: self.id,
        game_id: params[:game]
      )
    end

    new_item
  end
end
