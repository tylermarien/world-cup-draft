class AddCalculatedFieldsToTeams < ActiveRecord::Migration
  def change
      add_column :teams, :matches_played, :int, { default: 0 }
      add_column :teams, :countries_remaining, :int, { default: 0 }
      add_column :teams, :total, :int, { default: 0 }
  end
end
