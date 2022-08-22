# # frozen_string_literal: true

# require 'rails_helper'
# require 'simplecov'
# SimpleCov.start

# RSpec.describe Transaction, type: :model do
#   let(:user) { User.new(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

#   let(:transaction) { described_class.new(user_id: user.id, amount: 1, billing_cycle: 1) }

#   it { expect(transaction).to validate_numericality_of(:amount).is_greater_than(0) }

#   it { expect(transaction).to validate_numericality_of(:billing_cycle).is_greater_than(0) }

#   it { expect(transaction).to belong_to(:user) }

#   it 'has a unique billing_cycle with scoped user_id' do
#     user.save
#     transaction.save
#     transaction2 = described_class.new(user_id: user.id, amount: 1, billing_cycle: 1)
#     expect(transaction2).to be_invalid
#   end
# end
