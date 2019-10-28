# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @reviews = movie.reviews
    authorize @reviews
  end

  def new
    @movie = movie
    @review = @movie.reviews.new
    authorize @review
  end

  def create
    @movie = movie
    @review = @movie.reviews.build(review_params)
    authorize @review
    if @review.save
      flash.now[:notice] = 'Review saved!'
      redirect_to movie_path(@movie.id)
    else
      flash.now[:error] = 'Failed to create a review!'
      render :new
    end
  end

  def edit
    @movie = movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
  end

  def update
    @movie = movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
    if @review.update(review_params)
      flash.now[:notice] = 'Review updated!'
      redirect_to movie_path(movie.id)
    else
      flash.now[:error] = 'Failed to update review!'
      render :edit
    end
  end

  def destroy
    @movie = movie
    @review = @movie.reviews.find(params[:id])
    authorize @review
    if @review.delete
      flash.now[:notice] = 'Review deleted!'
    else
      flash.now[:error] = 'Failed to delete this review!'
    end
    redirect_to movie_path(movie.id)
  end

  private

  def review_params
    params.require(:review).permit(:rate, :description, :content).merge!(user_id: current_user.id)
  end

  def movie
    Movie.find(params[:movie_id])
  end
end
