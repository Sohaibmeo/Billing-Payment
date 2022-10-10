# frozen_string_literal: true

class AddColumnToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :date_end, :integer
  end
end
