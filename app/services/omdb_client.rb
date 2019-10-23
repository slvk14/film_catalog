class OmdbClient
  include Singleton
  def initialize
    @apikey = RCreds.fetch(:omdb, :api_key)
    @root_url = 'http://www.omdbapi.com'
  end

  def by_title(title:)
    all(t: String(title))
  end

  private
  
  def all(search_params = {})
    JSON.parse(RestClient.get(@root_url, params: search_params.merge!(base_params)))
  end

  def base_params
    { apikey: @apikey }
  end
end
