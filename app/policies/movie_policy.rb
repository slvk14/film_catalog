# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def show?
    true
  end

  def destroy?
    user.admin?
  end

  def add_to_list?
    true
  end

  def remove_from_watch_later?
    true
  end
end
