# frozen_string_literal: true

class AddAvatarsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :avatars, :json
  end
end
