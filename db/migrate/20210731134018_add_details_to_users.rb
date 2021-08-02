# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.text :bio
      t.string :phone
    end
  end
end
