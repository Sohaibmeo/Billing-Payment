# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :plan, :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
