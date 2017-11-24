class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order])
    session[:order] = @order.id
    @amount = dollars_to_cents(@order.grand_total)
    @description = "Atrium Order by #{@order.user.full_name}"
  end

  def create
    order = Order.find(session[:order])
    amount = dollars_to_cents(order.grand_total)

    charge_stripe order, amount

    flash[:success] = 'Your order was successfully placed'
    redirect_to user_path(current_user.username)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :new
  end

  private

  def charge_stripe(order, amount)
    customer = Stripe::Customer.create(email: params[:stripeEmail], source: params[:stripeToken])
    charge = Stripe::Charge.create(customer: customer.id,
                                   amount: amount,
                                   description: "Atrium Order by #{order.user.full_name}",
                                   currency: 'cad')

    return unless charge.paid
    session.delete :order
    order.status = 'Paid'
    order.save
  end

  def dollars_to_cents(amount)
    (100 * amount.to_r).to_i
  end
end
