# frozen_string_literal: true

class Plan < ApplicationRecord
  after_commit :assign_product_id, on: :create
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :items
  has_many :features, through: :items

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
    puts product_id
    save
  end
end
