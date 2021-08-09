# frozen_string_literal: true

class RemoveAvatarsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :avatars, :json
  end
end
