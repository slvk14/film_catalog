# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie, polymorphic: true, optional: true

  validates :rate, :description, presence: true
end
