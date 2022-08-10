class AddIndexToFeature < ActiveRecord::Migration[7.0]
  def change
    add_index :features, :name, unique: true
    add_index :features, :code, unique: true
  end
end
