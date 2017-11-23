class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order])
    @amount = dollars_to_cents(@order.total)
    @description = "Atrium Order by #{@order.user.full_name}"
  end

  def create
    order = Order.find(params[:order])
    amount = dollars_to_cents(order.total)

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Atrium Order by #{order.user.full_name}",
      currency: 'cad'
    )

    order.status = 'Paid'
    order.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :new
  end

  private

  def dollars_to_cents(amount)
    (100 * amount.to_r).to_i
  end
end
