class ScheduledMovieReviewerJob < ApplicationJob
  queue_as :default

  def perform
    p "Hello World!"
  end
end
