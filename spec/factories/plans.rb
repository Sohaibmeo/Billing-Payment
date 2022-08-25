# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    sequence(:name) { |n| "whatever#{rand(1..1000)}#{n}" }
    price { 20 }
  end
end
