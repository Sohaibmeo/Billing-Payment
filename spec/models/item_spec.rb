# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Item, type: :model do
  let(:item) { create(:item) }

  context 'with associations' do
    it { expect(item).to belong_to(:feature) }

    it { expect(item).to belong_to(:plan) }
  end

  context 'with validations' do\
    it { expect(item).to validate_uniqueness_of(:feature).scoped_to(:plan_id) }
  end
end
