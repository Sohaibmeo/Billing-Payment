# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Plan, type: :model do
  let(:plan) { build(:plan) }

  context 'with validations' do
    it { expect(plan).to validate_presence_of :name }

    it { expect(plan).to validate_uniqueness_of :name }

    it { expect(plan).to validate_presence_of :price }

    it { expect(plan).to validate_numericality_of(:price).is_greater_than(0) }
  end

  context 'with associations' do
    it { expect(plan).to have_many(:subscriptions) }

    it { expect(plan).to have_many(:users).through(:subscriptions) }

    it { expect(plan).to have_many(:items) }

    it { expect(plan).to have_many(:features).through(:items) }
  end

  context 'when saved' do
    it { expect { plan.save }.to change(plan, :product_id) }
  end
end
