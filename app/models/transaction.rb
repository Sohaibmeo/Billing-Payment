class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, :billing_cycle, numericality: { greater_than: 0 }
  validates :billing_cycle, uniqueness: { scope: :user_id }
end
