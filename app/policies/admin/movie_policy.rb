# frozen_string_literal: true

class Admin::MoviePolicy < ApplicationPolicy
  attr_reader :movie, :record

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end
end
