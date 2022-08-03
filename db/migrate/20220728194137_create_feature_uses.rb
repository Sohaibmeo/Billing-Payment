# frozen_string_literal: true

class CreateFeatureUses < ActiveRecord::Migration[7.0]
  def change
    create_table :feature_uses do |t|
      t.integer :total_units
      t.timestamps
    end
  end
end
