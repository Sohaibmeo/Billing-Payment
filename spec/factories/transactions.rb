# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    user
    amount { 1 }
    billing_cycle { 1 }
  end
end
