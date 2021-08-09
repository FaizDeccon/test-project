# frozen_string_literal: true

class DropVotes < ActiveRecord::Migration[5.2]
  def change
    drop_table :users do |t|
      t.string :name
    end
  end
end
