# frozen_string_literal: true

class AddIndexToFeatureuse < ActiveRecord::Migration[7.0]
  def change
    add_index :feature_uses, %i[feature_id plan_id usage_id], unique: true
  end
end
