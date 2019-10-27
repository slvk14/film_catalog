# frozen_string_literal: true

class MoviesController < ApplicationController
  after_action :verify_authorized

  def index
    @movies = Movie.search(params[:search])
    authorize @movies
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.delete
      flash.now[:notice] = 'Movie deleted!'
    else
      flash.now[:error] = 'Failed to delete this movie!'
    end
    redirect_to root_path
  end
end
