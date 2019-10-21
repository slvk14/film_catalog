# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  attr_reader :review, :record

  def index?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def show_all?
    user.admin?
  end
end
