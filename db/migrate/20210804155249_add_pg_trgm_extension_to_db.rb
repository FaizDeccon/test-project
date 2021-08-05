# frozen_string_literal: true

class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.2]
  def up
    execute 'create extension pg_trgm;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
