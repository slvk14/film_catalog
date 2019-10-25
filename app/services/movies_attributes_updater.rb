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

  private

  def prepare_imdb_ids
    @omdb_ids = Movie.all.pluck(:imdb_id)
  end

  def fetch_ombd_movies
    @omdb_movies = @omdb_ids.map do |id|
      @omdb_client.by_id(id: id)
    end
  end

  def update_movies_atributes
  end
end