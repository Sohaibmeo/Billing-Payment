# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :authenticate_user!
  def index
    @plan = Plan.find(params[:plan_id])
    @my_plan_id = @plan.id
    @session = Stripe::Checkout::Session.create({
                                                  success_url: new_subscription_url(my_plan_id: @my_plan_id),
                                                  cancel_url: 'http://127.0.0.1:3000/plans',
                                                  customer: current_user.customer_id,
                                                  line_items: [
                                                    { price: @plan.product_id, quantity: 1 }
                                                  ],
                                                  mode: 'subscription'
                                                })
                                                                 
  end
end
