# frozen_string_literal: true

class StripeSession
  include Rails.application.routes.url_helpers

  def initialize(plan_to_use, user_to_use)
    @plan = plan_to_use
    @current_user = user_to_use
  end

  def initiate_session
    @session = Stripe::Checkout::Session.create({
                                                  success_url: new_subscription_url,
                                                  cancel_url: plans_url,
                                                  customer: @current_user.customer_id,
                                                  line_items: [
                                                    { price: @plan.product_id, quantity: 1 }
                                                  ],
                                                  mode: 'subscription'
                                                })
  end
end
