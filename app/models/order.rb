class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :games, through: :order_items

  validates :status, :pst, :gst, :hst, :user, presence: true

  def create_order_item(game)
    order_items.create!(
      price: game.price,
      order: self,
      game: game
    )
  end
end
