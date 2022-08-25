# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    sequence(:name) { |n| "Hello#{n}" }
    price { 20 }
  end
end
