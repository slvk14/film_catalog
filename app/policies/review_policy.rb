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
    user.admin? || user.id == record.id
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
