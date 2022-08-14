class StripePrice
  def initialize(product_to_use)
    @product = product_to_use
  end

  def retreive_subscription
    Stripe::Subscription.retrieve(
      @product.subscription_id
    )
  end

  def delete_subscription
    Stripe::Subscription.delete(
      @subscription.id
    )
  end
end
