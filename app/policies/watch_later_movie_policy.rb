# frozen_string_literal: true

class WatchLaterMoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def add_to_list?
    true
  end

  def remove_from_watch_later?
    true
  end
end
