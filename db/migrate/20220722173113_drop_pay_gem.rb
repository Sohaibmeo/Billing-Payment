# frozen_string_literal: true

class DropPayGem < ActiveRecord::Migration[7.0]
  def up
    drop_table :pay_customers
    drop_table :pay_merchants
    drop_table :pay_payment_methods
    drop_table :pay_subscriptions
    drop_table :pay_webhooks
    drop_table :pay_charges
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
