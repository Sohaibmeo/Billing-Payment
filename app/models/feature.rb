# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :items
  has_many :plans, through: :items, dependent: :destroy
  has_many :feature_uses, dependent: :destroy
  has_many :usages, through: :feature_uses, dependent: :destroy
end
