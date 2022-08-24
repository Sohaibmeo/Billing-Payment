# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Usage, type: :model do
  let(:user) { create(:user) }

  let(:usage) { build(:usage, user_id: user.id) }

  context 'with associations' do
    it { expect(usage).to belong_to(:user) }

    it { expect(usage).to have_many(:feature_uses) }

    it { expect(usage).to have_many(:features).through(:feature_uses) }
  end

  context 'with callbacks' do
    it { expect(usage).to callback(:set_defaults).after(:initialize) }
  end

  context 'with validations' do
    it { expect(usage).to validate_uniqueness_of(:user) }
  end
end
