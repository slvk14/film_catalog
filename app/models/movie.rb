class Movie < ApplicationRecord
	has_many :reviews, as: :reviewable

	validates :title, :year, :genre, :director, :actors, 
	          :plot, :country, :metascore, :imdb_rating, presence: true
end
