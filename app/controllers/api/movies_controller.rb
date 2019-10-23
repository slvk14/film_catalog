class Api::MoviesController < Api::BaseController
  def index
  	record_response(Movie.all, 200)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
