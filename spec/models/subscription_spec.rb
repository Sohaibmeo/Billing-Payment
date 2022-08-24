# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
require 'stripe_mock'

SimpleCov.start

RSpec.describe Subscription, type: :model do
  let(:plan) { create(:plan) }
  let(:user) { create(:user) }
  let(:test_sub) { Stripe::Subscription.create(customer: user.customer_id, items: [{ price: plan.product_id }]) }
  let(:subscription) { build(:subscription, user_id: user.id, plan_id: plan.id, subscription_id: test_sub.id) }

  context 'with validations' do
    it { expect(subscription).to validate_uniqueness_of(:plan_id).scoped_to(:user_id) }

    it { expect(subscription).to validate_numericality_of(:overuse).is_greater_than_or_equal_to(0) }
  end

  context 'with associations' do
    it { expect(subscription).to belong_to(:plan) }

    it { expect(subscription).to belong_to(:user) }
  end

  context 'with callbacks' do
    it { expect(subscription).to callback(:assign_stripe_subscription).after(:commit) }
    it { expect(subscription).to callback(:delete_stripe_subscription).before(:destroy) }

    it 'is active' do
      retrieved = Stripe::Subscription.retrieve(subscription.subscription_id)
      expect(retrieved.status).to eq('active')
    end

    it 'is canceled' do
      subscription.destroy
      retrieved = Stripe::Subscription.retrieve(subscription.subscription_id)
      expect(retrieved.status).to eq('canceled')
    end
  end
end
