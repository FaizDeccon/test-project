# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :comment, :string, null: false
    change_column :posts, :avatars, :json, null: false
    change_column :stories, :avatar, :string, null: false
    change_table :users, bulk: true do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :username, null: false
    end
  end
end
