class MoviesController < ApplicationController
  after_action :verify_authorized 
  
	def index
    @movies = Movie.search(params[:search])
	end

  def show
    @user = User.find(params[:id])
  end

  def renew
  end
end
