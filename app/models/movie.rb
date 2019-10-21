# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, as: :reviewable

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
