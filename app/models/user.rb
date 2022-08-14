# frozen_string_literal: true

# here
class User < ApplicationRecord
  include Customer
  has_one :usage, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions, dependent: :destroy
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
