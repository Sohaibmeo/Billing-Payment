# frozen_string_literal: true

FactoryBot.define do
  factory :feature do
    name { 'whatever' }
    code { '1234' }
    max_unit_limit { 1 }
    unit_price { 1 }
  end
end
