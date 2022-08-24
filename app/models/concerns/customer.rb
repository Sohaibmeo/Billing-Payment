# frozen_string_literal: true

module Customer
  extend ActiveSupport::Concern
  included do
    after_commit :assign_customer_id, :assign_usage, on: :create
  end

  def assign_customer_id
    customer = Stripe::Customer.create({
                                         email: email
                                       })
    self.customer_id = customer.id
    save
  end

  def assign_usage
    build_usage
  end
end
