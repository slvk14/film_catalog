class ScheduledMovieReviewerJob < ApplicationJob
  queue_as :default

  def perform
    MoviesAttributesUpdater.new.call
  end
end
