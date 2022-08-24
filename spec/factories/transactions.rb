# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    user_id { 0 }
    amount { 1 }
    billing_cycle { 1 }
  end
end
