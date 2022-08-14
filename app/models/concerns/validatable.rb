module Validatable
  extend ActiveSupport::Concern
  included do
    validates :name, uniqueness: true, presence: true
    validates :code, uniqueness: true, length: { maximum: 6 }, presence: true
    validates :max_unit_limit, :unit_price, numericality: { greater_than: 0 }
  end
end
