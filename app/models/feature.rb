# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :plans, through: :items, dependent: :destroy
  has_many :feature_uses, dependent: :destroy
  has_many :usages, through: :feature_uses, dependent: :destroy
  validates :name, :code, uniqueness: true
  validates :code, length: { maximum: 6 }
  validates :max_unit_limit, :unit_price, numericality: true
end
