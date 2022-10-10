# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :plan
  belongs_to :feature
  validates :feature, uniqueness: { scope: :plan_id }
end
