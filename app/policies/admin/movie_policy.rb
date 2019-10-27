# frozen_string_literal: true

class Admin::MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    user.admin?
  end

  def new?
    create?
  end

  def create?
  	user.admin?
  end

  def refresh_movies?
    user.admin?
  end
end
