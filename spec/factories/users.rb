# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'sohaib@gmail.com' }
    password { 'Devsinc' }
    password_confirmation { 'Devsinc' }
  end
end
