class OmdbClient
  include Singletone

	def initialize
      @api_key = RCreds.fetch(:omdb, :api_key)
      @root_url = "http://www.omdbapi.com"
	end

  def all(params = {})
 	  RestClient.get(@root_url, params: params.merge!(base_params))
  end

  def search(title, search_params = {})
  	all(search_params.merge!(s: title))
  end
  
  def by_id(id)
    all(i: id)
  end

  # def by_title(title)
  # end

  private

  def base_params
  	{ api_key: @api_key}
  end
end