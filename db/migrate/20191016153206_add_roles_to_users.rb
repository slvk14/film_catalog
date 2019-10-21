# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, dafault: 1
  end
end
