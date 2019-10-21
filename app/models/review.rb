class Review < ApplicationRecord
	belongs_to :user
	belongs_to :movie, polymorphic: true

	validates :rate, :description, presence: true

  has_rich_text :description
end
