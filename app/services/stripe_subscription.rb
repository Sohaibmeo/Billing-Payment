class StripeSubscription
  def initialize(subscription_to_use)
    @subscription = subscription_to_use
  end

  def retreive_subscription
    Stripe::Subscription.retrieve(
      @subscription.subscription_id
    )
  end

  def delete_subscription
    Stripe::Subscription.delete(
      @subscription.id
    )
  end

  def recent_subscription
    Stripe::Subscription.list({ customer: @subscription }).first.id
  end
end
