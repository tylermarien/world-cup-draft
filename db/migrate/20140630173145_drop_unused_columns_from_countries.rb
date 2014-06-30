class DropUnusedColumnsFromCountries < ActiveRecord::Migration
  def change
    remove_column :countries, :matches_played, :integer
    remove_column :countries, :wins, :integer
    remove_column :countries, :losses, :integer
    remove_column :countries, :draws, :integer
    remove_column :countries, :goals_for, :integer
    remove_column :countries, :goals_against, :integer
  end
end
