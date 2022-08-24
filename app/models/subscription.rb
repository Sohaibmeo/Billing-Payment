# frozen_string_literal: true

class Subscription < ApplicationRecord
  include Stripable
  belongs_to :plan
  belongs_to :user
  validates :overuse, numericality: { greater_than_or_equal_to: 0 }
  validates :plan_id, uniqueness: { scope: :user_id }
end
