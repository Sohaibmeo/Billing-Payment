class AddIndexToItem < ActiveRecord::Migration[7.0]
  def change
    add_index :items, [:plan_id, :feature_id], unique: true
  end
end
