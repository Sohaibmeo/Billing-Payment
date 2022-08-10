# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  validates :overuse, numericality: true
  validates :plan_id, uniqueness: { scope: :user_id }
end
