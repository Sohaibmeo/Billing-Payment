# frozen_string_literal: true

class StripeSubscription
  def initialize(subscription_to_use)
    @subscription = subscription_to_use
  end

  def retreive_subscription
    Stripe::Subscription.retrieve(@subscription) unless @subscription.nil?
  end

  def delete_subscription
    Stripe::Subscription.delete(@subscription.id) unless @subscription.nil?
  end

  def recent_subscription
    subscription = Stripe::Subscription.list({ customer: @subscription }).first
    subscription&.id unless subscription.nil?
  end
end
