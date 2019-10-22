# frozen_string_literal: true

class ReviewsController < ApplicationController
  after_action :verify_authorized

  def index
    @reviews = Movie.find(params[:movie_id]).reviews
    authorize @reviews
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
    authorize @review
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    authorize @review
    byebug
    if @review.save
      flash.now[:notice] = 'Review saved!'
      redirect_to root_path
    else
      flash.now[:error] = 'Failed to create a review!'
      render :new
    end
  end

  def edit
    @review = resource
    authorize @review
  end

  def update
    @review = resource
    if @review.update(review_params)
      flash.now[:notice] = 'Review updated!'
      redirect_to index_path
    else
      flash.now[:error] = 'Failed to update review!'
      render :edit
    end
  end

  def destroy
    @review = resource

    if @review.delete
      flash.now[:notice] = 'Review deleted!'
    else
      flash.now[:error] = 'Failed to delete this review!'
    end
    redirect_to index_path
  end

  def show_all
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:rate, :description).merge!(user_id: current_user.id)
  end
end
