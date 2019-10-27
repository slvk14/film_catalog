class Admin::MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = OmdbClient.instance.by_title(title: params[:title])['Search']
  end

  def new
    @movie = OmdbClient.instance.by_id(id: params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash.now[:success] = 'Movie is saved!'
      redirect_to root_path
    else
      flash.now[:warning] = 'Movie is not saved!'
      redirect_to root_path
    end
  end

  def refresh_movies
    if ScheduledMovieReviewerJob.new.perform_now
      flash.now[:success] = 'Movies were updated'
      redirect_to root_path
    else
      flash.now[:warning] = 'Movies were not updated'
      redirect_to root_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :year,
                                  :release_date, :director, :actors, :plot,
                                  :metascore, :imdb_rating, :imdb_id, :country, :poster_url)
  end
end
