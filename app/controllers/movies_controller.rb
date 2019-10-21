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

  def renew; end
end
