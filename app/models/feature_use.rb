# frozen_string_literal: true

class FeatureUse < ApplicationRecord
  belongs_to :feature
  belongs_to :usage
end
