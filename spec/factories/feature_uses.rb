# frozen_string_literal: true

FactoryBot.define do
  factory :feature_use do
    feature
    usage_id { 1 }
    total_units { 6 }
    plan_id { 1 }
  end
end
