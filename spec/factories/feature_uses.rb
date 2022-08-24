# frozen_string_literal: true

FactoryBot.define do
  factory :feature_use do
    feature_id { 0 }
    usage_id { 0 }
    total_units { 6 }
    plan_id { 1 }
  end
end
