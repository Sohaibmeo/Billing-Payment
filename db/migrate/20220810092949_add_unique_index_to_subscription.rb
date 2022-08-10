class AddUniqueIndexToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_index :subscriptions, [:plan_id, :user_id], unique: true
  end
end
