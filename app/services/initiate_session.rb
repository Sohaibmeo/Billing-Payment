# frozen_string_literal: true

class InitiateSession
  def initialize(plan_to_use, user_to_use, succes_url)
    @plan = plan_to_use
    @current_user = user_to_use
    @success_url = succes_url
  end

  def initiate_session
    @session = Stripe::Checkout::Session.create({
                                                  success_url: @success_url,
                                                  cancel_url: 'http://127.0.0.1:3000/plans',
                                                  customer: @current_user.customer_id,
                                                  line_items: [
                                                    { price: @plan.product_id, quantity: 1 }
                                                  ],
                                                  mode: 'subscription'
                                                })
  end
end
