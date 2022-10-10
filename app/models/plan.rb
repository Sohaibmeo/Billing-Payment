# frozen_string_literal: true

class Plan < ApplicationRecord
  include Priceable
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :features, through: :items, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
