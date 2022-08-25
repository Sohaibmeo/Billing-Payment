# frozen_string_literal: true

FactoryBot.define do
  factory :feature do
    sequence(:name) { |n| "whatever#{n}" }
    code { '1234' }
    max_unit_limit { 1 }
    unit_price { 1 }
  end
end
