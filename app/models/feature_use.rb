# frozen_string_literal: true

class FeatureUse < ApplicationRecord
  belongs_to :feature
  belongs_to :usage
  validates :feature, uniqueness: { scope: [:plan_id, :usage_id] }
  validates :plan_id, :total_units, presence: true
end
