class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :games, through: :order_items

  validates :status, :pst, :gst, :hst, :user, presence: true

  def paid?
    status == 'Paid'
  end

  def total
    sub_total = order_items.map(&:price).reduce(:+)
    taxes = { PST: pst, GST: gst, HST: hst }.reject { |k, v| v.zero? }

    tax_amounts = taxes.map { |k, v| (sub_total * v).round(2) }
    sub_total + tax_amounts.reduce(:+)
  end

  def create_order_item(game)
    order_items.create!(
      price: game.price,
      order: self,
      game: game
    )
  end
end
