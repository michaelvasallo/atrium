class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :load_order

  def show
  end

  def new
  end

  def create
    order = create_order
    if order.grand_total == 0
      order.status = 'Paid'
      order.save
      add_games_to_library order
    else
      session[:cart].clear
      redirect_to payment_path(order: order.id)
    end
  end

  private

  def load_order
    @games = Game.where(slug: session[:cart])
    @sub_total = calculate_sub_total @games
    province = current_user.province

    @taxes = taxes_to_hash province.pst, province.gst, province.hst

    @tax_amounts = calculate_amounts @sub_total, @taxes
    @grand_total = @sub_total + @tax_amounts.reduce(:+)
  end

  def calculate_sub_total(games)
    games.map(&:sale_price).reduce(:+)
  end

  def taxes_to_hash(pst, gst, hst)
    { PST: pst, GST: gst, HST: hst }.reject { |_, v| v.zero? }
  end

  def calculate_amounts(sub_total, taxes)
    taxes.map { |_, v| (sub_total * v).round(2) }
  end

  def create_order
    province = current_user.province

    order = current_user.orders.create!(
      status: 'Pending',
      pst: province.pst,
      gst: province.gst,
      hst: province.hst
    )

    @games.each { |game| order.create_order_item(game) }

    order
  end
end
