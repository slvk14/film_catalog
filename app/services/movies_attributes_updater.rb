class MoviesAttributesUpdater

  attr_reader :omdb_client	
  def initializer
  	@omdb_client = OmdbCLient.instance
  end

  def call
    prepare_imdb_ids
    fetch_omdb_movies
    update_movie_attributes
  end
 
  def prepare_imdb_ids
  	ids = []
  	Movies.all.each do |x|
  	  ids << x.imbd
  	end
    return ids 
  end 

  def fetch_omdb_movies
    movies = {}
    prepare_imdb_ids.each do |id|
      movies << @omdb_client.by_id(id: x)
    end
  end
end
