# frozen_string_literal: true

class AddIndexToPlan < ActiveRecord::Migration[7.0]
  def change
    add_index :plans, :name, unique: true
  end
end
