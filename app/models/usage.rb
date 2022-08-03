# frozen_string_literal: true

class Usage < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :user
  has_many :feature_uses
  has_many :features, through: :feature_uses

  def set_defaults
    self.overuse_total = 0 if new_record?
  end
end
