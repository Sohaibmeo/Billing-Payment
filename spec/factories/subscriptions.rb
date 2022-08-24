# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user_id { 20 }
    plan_id { 20 }
    overuse { 20 }
    subscription_id { 'hehe' }
  end
end
