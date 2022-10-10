# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Transaction, type: :model do
  let(:user) { create(:user) }
  let(:transaction) { build(:transaction) }

  context 'with validations' do
    it { expect(transaction).to validate_numericality_of(:amount).is_greater_than(0) }

    it { expect(transaction).to validate_numericality_of(:billing_cycle).is_greater_than(0) }

    it { expect(transaction).to validate_uniqueness_of(:billing_cycle).scoped_to(:user_id) }
  end

  context 'with associations' do
    it { expect(transaction).to belong_to(:user) }
  end
end
