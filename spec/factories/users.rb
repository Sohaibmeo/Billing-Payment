# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "s#{n}@gmail.com" }
    password { 'Devsinc' }
    password_confirmation { 'Devsinc' }
  end
end
