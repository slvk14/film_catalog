# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    user.admin?
  end

  def show?
    user.admin? || user.id == record.id
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def activate?
    user.admin?
  end
end
