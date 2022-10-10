# frozen_string_literal: true

class RenameSubscription < ActiveRecord::Migration[7.0]
  def change
    rename_column :subscriptions, :s_type, :subscription_id
  end
end
