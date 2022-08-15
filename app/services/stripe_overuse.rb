class StripeOveruse
  def initialize(subscription_to_use)
    @subscription = subscription_to_use
  end

  def over_use
    customer = Stripe::Customer.retrieve(@subscription.user.customer_id)
    card = Stripe::Customer.create_source(
      customer.id,
      { source: 'tok_amex' }
    )
    charge = Stripe::Charge.create(
      {
        amount: @subscription.overuse * 100,
        currency: 'usd',
        customer: customer.id,
        source: card,
        description: 'OverCharge Payment'
      })
    current_user = User.find_by(id: @subscription.user.id)
    plan = Plan.find_by(id: @subscription.plan_id)
    plan.features.each do |f|
      feature = Feature.find_by(id: f.id)
      feature.feature_uses.each do |fu|
        fu.total_units = 0
        fu.save
      end
    end
    return charge unless nil?
  end
end
