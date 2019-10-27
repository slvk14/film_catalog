# frozen_string_literal: true

class WatchLaterMoviesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @movies = current_user.movies
    authorize @movies
  end

  def add_to_list
    @movie = Movie.find(params[:watch_later_movie_id])
    authorize @movie
    if !current_user.movies.include? @movie
      current_user.movies << @movie
      flash.now[:notice] = 'Movie added!'
      redirect_to watch_later_movies_path
    else
      flash.now[:error] = 'Failed to add this movie!'
      redirect_to root_path
    end
  end

  def remove_from_watch_later
    @movie = Movie.find(params[:watch_later_movie_id])
    authorize @movie
    if current_user.movies.delete(@movie)
      flash.now[:notice] = 'Movie deleted!'
      redirect_to watch_later_movies_path
    else
      flash.now[:error] = 'Failed to delete this movie!'
      redirect_to root_path
    end
  end
end
