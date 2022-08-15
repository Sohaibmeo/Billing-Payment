class RemoveIndexFromFeatureuse < ActiveRecord::Migration[7.0]
  def change
    remove_index :feature_uses, name: "index_feature_uses_on_feature_id_and_plan_id"
  end
end
