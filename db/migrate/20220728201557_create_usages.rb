# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :usages do |t|
      t.boolean 'over_limit'
      t.float 'overuse_total'
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.timestamps
    end
  end
end
