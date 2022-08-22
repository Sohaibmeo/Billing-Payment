# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe Usage, type: :model do
  let(:user) { User.new(email: 'sohaib@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  let(:usage) { described_class.new(user_id: user.id) }

  it { expect(usage).to belong_to(:user) }

  it { expect(usage).to have_many(:feature_uses) }

  it { expect(usage).to have_many(:features).through(:feature_uses) }

  it { expect(usage.overuse_total).to eq(0.0) }

  it 'has a unique usage with scoped user_id' do
    user.save
    usage.save
    usage2 = described_class.new(user_id: user.id)
    expect(usage2).to be_invalid
  end
end
