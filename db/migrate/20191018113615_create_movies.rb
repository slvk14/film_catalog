# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, default: ''
      t.integer :year, null: false, default: 2000
      t.string :genre, null: false, default: ''
      t.string :director, null: false, default: ''
      t.string :actors, null: false, default: ''
      t.text :plot, null: false, default: ''
      t.string :country, null: false, default: ''
      t.integer :metascore
      t.float :imdb_rating

      t.timestamps
    end
  end
end
