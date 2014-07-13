class AddPlacingToCountriesTable < ActiveRecord::Migration
  def change
    add_column :countries, :placing, :integer
  end
end
