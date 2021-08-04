# frozen_string_literal: true

class DropImages < ActiveRecord::Migration[5.2]
  def change
    drop_table :images do |t|
      t.string :name
    end
  end
end
