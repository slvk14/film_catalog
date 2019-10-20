class ReviewsController < ApplicationController
  after_action :verify_authorized 
  
  def index
    @reviews = collection
  end

  def new
    @review = parent.reviws.build
  end

  def create
    @review = parent.reviews.build
    if @review.save
      flash.now[:notice] = 'Review saved!'
      redirect_to index_path
    else
      flash.now[:error] = 'Failed to create a review!'
      render :new
    end
  end

  def edit
    @review = resource
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

  def collection
    current_user.reviews
  end

  def parent
    current_user
  end

  def params
    params.require(:review).permit(:rate, :description)
  end
end
