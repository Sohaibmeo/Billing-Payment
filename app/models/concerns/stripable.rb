# frozen_string_literal: true

module Stripable
  extend ActiveSupport::Concern
  included do
    after_commit :assign_stripe_subscription, on: :create
    before_destroy :delete_stripe_subscription
  end

  def assign_stripe_subscription
    self.subscription_id = StripeSubscription.new(user.customer_id).recent_subscription
    stripe_subscription = StripeSubscription.new(subscription_id).retreive_subscription
    self.date_end = stripe_subscription.current_period_end unless stripe_subscription.nil?
    save
  end

  def delete_stripe_subscription
    self.overuse = 0
    FeatureUse.where(plan_id: plan_id, usage_id: user.usage.id).destroy_all
    subscribed = StripeSubscription.new(subscription_id).retreive_subscription
    StripeSubscription.new(subscribed).delete_subscription
  end
end
