# frozen_string_literal: true

class CheckoutController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
    @my_plan_id = @plan.id
    @session = Stripe::Checkout::Session.create({
                                                  success_url: subscriptions_url(my_plan_id: @my_plan_id),
                                                  cancel_url: 'http://127.0.0.1:3000/plans',
                                                  customer: current_user.customer_id,
                                                  line_items: [
                                                    { price: @plan.product_id, quantity: 1 }
                                                  ],
                                                  mode: 'subscription'
                                                })

    
    # session['line_items'] = Stripe::Checkout::LineItem.( @session.id, {limit: 1}).first
    # li_1LSQq0KkpqXslIQH0hIKcqw5                                        
  end
end
