class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def create
    @cart.add_game(params)

    if @cart.save
      flash[:positive] = 'Added to cart'
    else
      flash[:negative] = 'There was a problem adding this item to your cart'
    end

    redirect_back(fallback_location: :games)
  end

  def destroy
    @cart_item.destroy

    redirect_to cart_path
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :game_id)
  end
end
