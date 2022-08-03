# frozen_string_literal: true

class AddProductidToPlan < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :product_id, :string
  end
end
