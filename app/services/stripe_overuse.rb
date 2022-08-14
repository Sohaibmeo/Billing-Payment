class StripeOveruse
  def initialize(plan_to_use, user_to_use, succes_url)
    @plan = plan_to_use
    @current_user = user_to_use
    @success_url = succes_url
  end

  def over_use
    overuse_price = @current_user.usage.overuse_total.round * 100
    product = Stripe::Product.create(
      name: 'Overcharge'
    )
    product_price = Stripe::Price.create(
      currency: 'usd',
      unit_amount: overuse_price,
      recurring: { interval: 'month' },
      product: product['id']
    )
  end
end
