# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def show?
    true
  end

  def create?
  	user.admin?
  end

  def destroy?
    user.admin?
  end
end
