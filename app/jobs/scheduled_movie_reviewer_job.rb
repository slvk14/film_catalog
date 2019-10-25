class ScheduledMovieReviewerJob < ApplicationJob
  queue_as :default

  def perform
    #MoviesAttributesUpdater.new.call
    p "Hello World"
  end
end
