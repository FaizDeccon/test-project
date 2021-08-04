# frozen_string_literal: true

class AddTotalLikesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :total_likes, :integer
  end
end
