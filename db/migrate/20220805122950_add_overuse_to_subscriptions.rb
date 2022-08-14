# frozen_string_literal: true

class AddOveruseToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :overuse, :integer
  end
end
