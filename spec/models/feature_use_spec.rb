# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe FeatureUse, type: :model do
  let(:feature) { create(:feature) }
  let(:user) { create(:user) }
  let(:feature_use) { build(:feature_use, usage_id: user.usage.id, feature_id: feature.id) }

  context 'with validations' do
    it { expect(feature_use).to validate_presence_of :total_units }

    it { expect(feature_use).to validate_presence_of :plan_id }

    it { expect(feature_use).to validate_uniqueness_of(:feature).scoped_to(:plan_id, :usage_id) }
  end

  context 'with associations' do
    it { expect(feature_use).to belong_to(:feature) }

    it { expect(feature_use).to belong_to(:usage) }
  end
end
