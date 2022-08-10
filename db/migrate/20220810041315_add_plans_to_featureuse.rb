class AddPlansToFeatureuse < ActiveRecord::Migration[7.0]
  def change
    add_column :feature_uses, :plan_id, :integer
  end
end
