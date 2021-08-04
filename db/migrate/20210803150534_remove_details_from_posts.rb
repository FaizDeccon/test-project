# frozen_string_literal: true

class RemoveDetailsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :cached_votes_total, :integer
    remove_column :posts, :cached_votes_score, :integer
    remove_column :posts, :cached_votes_up, :integer
    remove_column :posts, :cached_votes_down, :integer
    remove_column :posts, :cached_weighted_score, :integer
    remove_column :posts, :cached_weighted_total, :integer
    remove_column :posts, :cached_weighted_average, :float
  end
end
