class Admin::MoviesController < ApplicationController

  def index
  	@movies = OmdbClient.instance.by_id(params[:title])
  end
  
  # def api_search
  # 	if params[:title]
  # 	 @movies = OmdbClient.instance.by_id(params[:title])
  # 	end
  # end

  private

  def search_params

  end
end