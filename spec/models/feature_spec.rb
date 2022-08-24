# # frozen_string_literal: true

# require 'rails_helper'
# require 'simplecov'
# SimpleCov.start

# RSpec.describe Feature, type: :model do
#   let(:feature) { build(:feature) }

#   context 'with validations' do
#     it { expect(feature).to validate_numericality_of(:max_unit_limit).is_greater_than(0) }

#     it { expect(feature).to validate_numericality_of(:unit_price).is_greater_than(0) }

#     it { expect(feature).to validate_uniqueness_of :name }

#     it { expect(feature).to validate_uniqueness_of(:code).case_insensitive }

#     it { expect(feature).to validate_presence_of :name }

#     it { expect(feature).to validate_presence_of :code }

#     it { expect(feature).to validate_length_of(:code).is_at_most(6) }
#   end

#   context 'with associations' do
#     it { expect(feature).to have_many(:plans) }

#     it { expect(feature).to have_many(:feature_uses) }

#     it { expect(feature).to have_many(:usages) }

#     it { expect(feature).to have_many(:items) }
#   end
# end
