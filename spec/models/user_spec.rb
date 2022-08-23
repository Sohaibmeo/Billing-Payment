# frozen_string_literal: true

require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe User, type: :model do
  let(:user) { described_class.new(email: 'sohaib@gmail.com', password: 'Devsinc', password_confirmation: 'Devsinc') }

  it { expect(user).to have_many(:subscriptions) }

  it { expect(user).to have_one(:usage) }

  it { expect(user).to have_many(:plans).through(:subscriptions) }

  it { expect(user).to have_many(:transactions) }

  it { expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it { expect { user.save }.to change(user, :customer_id) }
end
