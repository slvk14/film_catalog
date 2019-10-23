class Admin::MoviesController < ApplicationController
  def index
    @movie = OmdbClient.instance.by_title(title: params[:title])
    authorize @movie
  end

  def create
    @movie = Movie.new(movie_params)
    authorize @movie
    if @movie.save
      flash.now[:success] = 'Movie is saved!'
      redirect_to admin_movie_path
    else
      flash.now[:warning] = 'Movie is not saved!'
      redirect_to admin_movie_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :ganre, :release_date, :director, :actors, :plot, :metascore, :imdbRating, :imdb_id)
  end
end
