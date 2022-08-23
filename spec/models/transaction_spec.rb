# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Transaction, type: :model do
  let(:user) { User.create(email: 'sohaibmayo12@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  let(:transaction) { described_class.new(user_id: user.id, amount: 1, billing_cycle: 1) }

  context 'with validations' do
    it { expect(transaction).to validate_numericality_of(:amount).is_greater_than(0) }

    it { expect(transaction).to validate_numericality_of(:billing_cycle).is_greater_than(0) }

    it 'has a unique billing_cycle with scoped user_id' do
      transaction.save
      transaction2 = described_class.new(user_id: user.id, amount: 1, billing_cycle: 1)
      expect(transaction2).to be_invalid
    end
  end

  context 'with associations' do
    it { expect(transaction).to belong_to(:user) }
  end
end
