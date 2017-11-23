class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :game

  validates :price, :order, :game, presence: true
end
