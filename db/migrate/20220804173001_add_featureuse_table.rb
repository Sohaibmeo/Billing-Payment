# frozen_string_literal: true

class AddFeatureuseTable < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_uses do |t|
      t.integer :total_units
      t.references :usage, :feature, null: false, foreign_key: true
      t.timestamps
    end
  end
end
