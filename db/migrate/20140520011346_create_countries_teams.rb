class CreateCountriesTeams < ActiveRecord::Migration
  def change
    create_table :countries_teams, id: false do |t|
      t.belongs_to :country
      t.belongs_to :team
    end
  end
end
