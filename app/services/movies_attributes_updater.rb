class MoviesAttributesUpdater
  attr_reader :omdb_client

  def initialize
    @omdb_client = OmdbClient.instance
  end

  def call
    prepare_imdb_ids
    fetch_ombd_movies
    update_movies_atributes
  end



  def prepare_imdb_ids
    @omdb_ids = Movie.all.pluck(:imdb_id)
  end

  def fetch_ombd_movies
    @omdb_movies = @omdb_ids.map do |id|
      @omdb_client.by_id(id: id)
    end
  end

  def update_movies_atributes
    @omdb_movies.each do |params|
      Movie.find_by(imdb_id: params["imdbID"]).update(title: params['Title'], genre: params['Genre'], year: params['Year'], director: params['Director'],
                   actors: params['Actors'], plot: params['Plot'], metascore: params['Metascore'], imdb_rating: params['imdbRating'], imdb_id: params['imdbID'])
    end
  end
end
