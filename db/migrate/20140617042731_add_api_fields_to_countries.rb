class AddApiFieldsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :api_id, :string
    add_column :countries, :logo, :string
    add_column :countries, :group, :string
    add_column :countries, :group_rank, :integer
    add_column :countries, :group_points, :integer
    add_column :countries, :matches_played, :integer
    add_column :countries, :wins, :integer
    add_column :countries, :losses, :integer
    add_column :countries, :draws, :integer
    add_column :countries, :goals_for, :integer
    add_column :countries, :goals_against, :integer
  end
end
