# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :items
  has_many :plans, through: :items
  has_many :feature_uses
  has_many :usages, through: :feature_uses
end
