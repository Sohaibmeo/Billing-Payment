# # frozen_string_literal: true

# require 'rails_helper'
# require 'simplecov'
# SimpleCov.start

# RSpec.describe Subscription, type: :model do
#   let(:plan) { create(:plan) }
#   let(:user) { create(:user) }
#   let(:subscription) { build(:subscription, user_id: user.id, plan_id: plan.id) }

#   context 'with validations' do
#     it { expect(subscription).to validate_uniqueness_of(:plan_id).scoped_to(:user_id) }

#     it { expect(subscription).to validate_numericality_of(:overuse).is_greater_than_or_equal_to(0) }
#   end

#   context 'with associations' do
#     it { expect(subscription).to belong_to(:plan) }

#     it { expect(subscription).to belong_to(:user) }
#   end

#   context 'with callbacks' do
#     it { expect(subscription).to callback(:assign_stripe_subscription).after(:commit) }
#     it { expect(subscription).to callback(:delete_stripe_subscription).before(:destroy) }
#   end
# end
