# frozen_string_literal: true

module Helpers
  def get_stripe_id(plan, user, stripe_helper)
    stripe_plan = stripe_helper.create_plan({
                                              id: plan.name,
                                              amount: plan.price,
                                              currency: 'usd', interval: 'month'
                                            })
    customer = Stripe::Customer.create({
                                         email: user.email,
                                         source: stripe_helper.generate_card_token,
                                         plan: stripe_plan
                                       })
    Stripe::Subscription.list({ customer: customer }).first.id
  end
end
