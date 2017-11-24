class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :games, through: :order_items

  validates :status, :pst, :gst, :hst, :user, presence: true

  def paid?
    status == 'Paid'
  end

  def sub_total
    order_items.map(&:price).reduce(:+)
  end

  def taxes
    { PST: pst, GST: gst, HST: hst }.reject { |_, v| v.zero? }
  end

  def tax_amounts
    taxes.map { |_, v| (sub_total * v).round(2) }
  end

  def grand_total
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
