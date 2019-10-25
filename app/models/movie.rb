# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :watch_later_movies
  has_many :users, through: :watch_later_movies

  validates :title, :year, :genre, :director, :actors,
            :plot, :country, :metascore, :imdb_rating, presence: true

  def self.search(search)
    if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"])
    else
      Movie.all
    end
  end
end
