module Priceable
  extend ActiveSupport::Concern
  included do
    after_commit :assign_product_id, on: :create
  end

  def assign_product_id
    product = Stripe::Product.create(
      name: name
    )
    product_price = Stripe::Price.create(
      currency: 'usd',
      unit_amount: price * 100,
      recurring: { interval: 'month' },
      product: product['id']
    )
    self.product_id = product_price.id
    save
  end
end
