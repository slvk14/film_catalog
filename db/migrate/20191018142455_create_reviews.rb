# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rate, null: false
      t.text :description, null: false
      t.references :reviewable, polymorphic: true
      t.references :user

      t.timestamps
    end
  end
end
