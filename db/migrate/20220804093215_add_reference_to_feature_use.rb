class AddReferenceToFeatureUse < ActiveRecord::Migration[7.0]
  def change
    drop_table :feature_uses
  end
end
