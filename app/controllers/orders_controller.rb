class OrdersController < ApplicationController
  before_action :load_order

  def checkout
  end

  def create
    create_order
    session[:cart].clear

    flash[:success] = 'Your purchases were successfully added to your library'
    redirect_to user_path(current_user.username)
  end

  private

  def load_order
    @games = Game.where(slug: session[:cart])
    @sub_total = @games.map(&:sale_price).reduce(:+)
    province = current_user.province

    if current_user && current_user.address
      @taxes = {
        PST: province.pst,
        GST: province.gst,
        HST: province.hst
      }.reject { |k, v| v.zero? }

      @tax_amounts = @taxes.map { |k, v| (@sub_total * v).round(2) }
      @grand_total = @sub_total + @tax_amounts.reduce(:+)
    end
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
  end
end
