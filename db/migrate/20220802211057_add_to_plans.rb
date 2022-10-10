# frozen_string_literal: true

class AddToPlans < ActiveRecord::Migration[7.0]
  def change
    change_column(:plans, :price, :integer)
  end
end
