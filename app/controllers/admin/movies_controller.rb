class Admin::MoviesController < ApplicationController
  def index
    @movie = OmdbClient.instance.by_title(title: params[:title])
  end

  def create
    @movie = Movie.new(movie_params)
    authorize @movie
    if @movie.save
      flash.now[:success] = 'Movie is saved!'
      redirect_to admin_movies_path
    else
      flash.now[:warning] = 'Movie is not saved!'
      redirect_to admin_movies_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :year, 
                 :release_date, :director, :actors, :plot, 
                 :metascore, :imdb_rating, :imdb_id, :country)
  end
end
