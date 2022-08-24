# # frozen_string_literal: true

# require 'rails_helper'
# require 'simplecov'
# SimpleCov.start

# RSpec.describe User, type: :model do
#   let(:user) { build(:user) }

#   context 'with associations' do
#     it { expect(user).to have_many(:subscriptions) }

#     it { expect(user).to have_one(:usage) }

#     it { expect(user).to have_many(:plans).through(:subscriptions) }

#     it { expect(user).to have_many(:transactions) }
#   end

#   context 'with validations' do
#     it { expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
#   end

#   context 'when callbacks' do
#     it { expect(user).to callback(:assign_customer_id).after(:commit) }
#   end
# end
