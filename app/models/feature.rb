# frozen_string_literal: true

class Feature < ApplicationRecord
  include Validatable
  has_many :items, dependent: :destroy
  has_many :plans, through: :items, dependent: :destroy
  has_many :feature_uses, dependent: :destroy
  has_many :usages, through: :feature_uses, dependent: :destroy
end
