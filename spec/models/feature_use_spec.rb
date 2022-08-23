# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe FeatureUse, type: :model do
  let(:feature) { Feature.create(name: 'test_feature', code: 1234, max_unit_limit: 1, unit_price: 1) }

  let(:user) { User.create(email: 'sohaibmayo13@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  let(:feature_use) { described_class.new(total_units: 6, plan_id: 1, feature_id: feature.id) }

  context 'with validations' do
    it { expect(feature_use).to validate_presence_of :total_units }

    it { expect(feature_use).to validate_presence_of :plan_id }

    it 'has a unique feature with scoped plan_id and usage_id' do
      feature_use.usage_id = user.usage.id
      feature_use.save
      feature_use2 = described_class.new(total_units: 5, plan_id: 1, feature_id: feature.id, usage_id: user.usage.id)
      expect(feature_use2).to be_invalid
    end
  end

  context 'with associations' do
    it { expect(feature_use).to belong_to(:feature) }

    it { expect(feature_use).to belong_to(:usage) }
  end
end
