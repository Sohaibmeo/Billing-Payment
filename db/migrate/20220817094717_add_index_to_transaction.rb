# frozen_string_literal: true

class AddIndexToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_index :transactions, %i[billing_cycle user_id], unique: true
  end
end
