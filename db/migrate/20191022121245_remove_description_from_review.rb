class RemoveDescriptionFromReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :description
  end
end
