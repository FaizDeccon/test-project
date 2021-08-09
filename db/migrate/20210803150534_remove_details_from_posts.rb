# frozen_string_literal: true

class RemoveDetailsFromPosts < ActiveRecord::Migration[5.2]
  def change
    change_table :posts, bulk: true do |t|
      t.integer :cached_votes_total
      t.integer :cached_votes_score
      t.integer :cached_votes_up
      t.integer :cached_votes_down
      t.integer :cached_weighted_score
      t.integer :cached_weighted_total
      t.float :cached_weighted_average
    end
  end
end
