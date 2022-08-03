# frozen_string_literal: true

class RemoveUsage < ActiveRecord::Migration[7.0]
  def change
    drop_table :usages
  end
end
