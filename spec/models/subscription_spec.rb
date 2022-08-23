# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Subscription, type: :model do
  let(:plan) { Plan.create(name: 'TestPlan', price: 20) }

  let(:user) { User.create(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  let(:subscription) { described_class.new(user_id: user.id, plan_id: plan.id, overuse: 20) }

  context 'with validations' do
    it { expect(subscription).to validate_numericality_of(:overuse).is_greater_than_or_equal_to(0) }

    it 'has a unique plan with scoped user' do
      subscription.save
      subscription2 = described_class.new(user_id: user.id, plan_id: plan.id, overuse: 0)
      expect(subscription2).to be_invalid
    end
  end

  context 'with associations' do
    it { expect(subscription).to belong_to(:plan) }

    it { expect(subscription).to belong_to(:user) }
  end

  context 'with callbacks' do
    it { expect { subscription.destroy }.to change(subscription, :overuse) }
  end
end
