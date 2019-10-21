# frozen_string_literal: true

class AddActiveToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :active, :boolean, default: true, null: false
  end
end
