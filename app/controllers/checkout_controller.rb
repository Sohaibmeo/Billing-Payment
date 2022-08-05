# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :authenticate_user!
  def index
    @plan = Plan.find(params[:plan_id])
    @my_plan_id = @plan.id
    @type = 'subscription'
    @overuse_price = (current_user.usage.overuse_total.round + 1) * 100
    product = Stripe::Product.create(
      name: "Overcharge"
    )
    product_price = Stripe::Price.create(
      currency: 'usd',
      unit_amount: @overuse_price ,
      recurring: { interval: 'month' },
      product: product['id']
    )
    @discount = Stripe::Coupon.create({amount_off: @overuse_price, duration: 'once', name: 'Overuse', currency: 'usd'})
    @session = Stripe::Checkout::Session.create({
                                                  success_url: new_subscription_url(my_plan_id: @my_plan_id),
                                                  cancel_url: 'http://127.0.0.1:3000/plans',
                                                  customer: current_user.customer_id,
                                                  line_items: [
                                                    { price: @plan.product_id, quantity: 1 },
                                                    { price: product_price.id, quantity: 1 }
                                                  ],
                                                  discounts: [{
                                                    coupon: @discount.id
                                                  }],
                                                  mode: @type
                                                })
                                                                 
  end
end
