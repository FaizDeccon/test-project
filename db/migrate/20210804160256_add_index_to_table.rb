# frozen_string_literal: true

class AddIndexToTable < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'btree_gin'

    add_index :users, :firstname, using: :gin
    add_index :users, :lastname, using: :gin
    add_index :users, :username, using: :gin
  end
end
