# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie, polymorphic: true, optional: true

  validates :rate, :content, presence: true
  validates :rate, numericality: { only_integer: true }, inclusion: { in: 0..10 }
  
  has_rich_text :content
end
