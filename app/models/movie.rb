# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :watch_later_movies
  has_many :users, through: :watch_later_movies

  validates :title, :year, :genre, :director, :actors,
            :plot, :country, :metascore, :imdb_rating, :imdb_id, :poster_url, presence: true

  def self.search(title:)
    if title
      where('title LIKE ?', "%#{title}%")
    else
      all
    end
  end

  def self.average_rate(movie:)
    @movie = movie
    @movie.reviews.average(:rate).round(1)
  end
end
