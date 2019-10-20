class MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    true
  end

  def show?
    true
  end

  def renew
    user.admin?
  end
end
