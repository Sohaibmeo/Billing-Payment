# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :price
      t.boolean :recurring

      t.timestamps
    end
  end
end
