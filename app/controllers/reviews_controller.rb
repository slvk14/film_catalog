class ReviewsController < ApplicationController
  before_action :load_reviewable
  after_action :verify_authorized
  
  def index
    @reviewable = Movie.find(params[:movie_id])
    @reviews = @reviewable.reviews
    authorize @reviews
  end

  def new
    @review = @reviewable.reviews.new
    @review.user_id = current_user.id
    authorize @review
  end

  def create
    @review = @reviewable.reviews.build(review_params)
    authorize @review
    byebug
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

  def load_reviewable
    resource, id = request.path.split('/')[1,2]
    @reviewable = resource.singularize.classify.constantize.find(id)
  end

  def review_params
    params.require(:review).permit(:rate, :description)
  end
end
