# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Item, type: :model do
  let(:plan) { Plan.create(name: 'TestPlan', price: 20) }

  let(:feature) { Feature.create(name: 'TestFeature2', code: 1234, max_unit_limit: 1, unit_price: 1) }

  let(:item) { described_class.new(feature_id: feature.id, plan_id: plan.id) }

  context 'with associations' do
    it { expect(item).to belong_to(:feature) }

    it { expect(item).to belong_to(:plan) }
  end

  context 'with validations' do
    it 'has a unique feature with scoped plan_id' do
      item.save
      item2 = described_class.new(feature_id: feature.id, plan_id: plan.id)
      expect(item2).to be_invalid
    end
  end
end
