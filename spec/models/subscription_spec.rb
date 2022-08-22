# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Subscription, type: :model do
  let(:plan) { Plan.new(name: 'TestPlan', price: 20) }

  let(:user) { User.new(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  let(:subscription) { described_class.new(user_id: user.id, plan_id: plan.id, overuse: 20) }

  before do
    plan.save
    user.save
  end

  it { expect(subscription).to validate_numericality_of(:overuse).is_greater_than_or_equal_to(0) }

  it { expect(subscription).to belong_to(:plan) }

  it { expect(subscription).to belong_to(:user) }

  it { expect { subscription.destroy }.to change(subscription, :overuse) }

  it 'has a unique plan with scoped user' do
    subscription.save
    subscription2 = described_class.new(user_id: user.id, plan_id: plan.id, overuse: 0)
    expect(subscription2).to be_invalid
  end
end
