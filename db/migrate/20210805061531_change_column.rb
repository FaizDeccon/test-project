# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :comment, :string, null: false
    change_column :posts, :avatars, :json, null: false
    change_column :stories, :avatar, :string, null: false
  end
end
