# frozen_string_literal: true

class Usage < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :user
  has_many :feature_uses, dependent: :destroy
  has_many :features, through: :feature_uses, dependent: :destroy
  validates :user, uniqueness: true

  private

  def set_defaults
    self.overuse_total = 0
  end
end
