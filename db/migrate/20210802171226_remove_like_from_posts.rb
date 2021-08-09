# frozen_string_literal: true

class RemoveLikeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :like, :integer
  end
end
