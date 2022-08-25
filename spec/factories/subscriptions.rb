# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user
    plan
    overuse { 20 }
    subscription_id { 'sub_1LaSgB2xToAoV8ch4AsYgt0y' }
  end
end
