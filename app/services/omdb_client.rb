class OdbClient
	def initialize
      @api_key = RCreds.fetch(:omdb, :api_key)
      @root_url = 
	end

    def all(params = {})
    	RestClient.get(@root_url, params base_params.merge!(params))
    end

    def search(title, search_params = {})
    	all(search_params.merge!(s: title))
    
    def by_id(id)
      al(i: id)
    end

    private

    def base_params
    	{ api_key: @api_}
    end
end