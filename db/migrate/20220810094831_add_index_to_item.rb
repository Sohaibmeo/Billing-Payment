# frozen_string_literal: true

class AddIndexToItem < ActiveRecord::Migration[7.0]
  def change
    add_index :items, %i[plan_id feature_id], unique: true
  end
end
