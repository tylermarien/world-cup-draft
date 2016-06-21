class AddEliminatedToCountries < ActiveRecord::Migration
  def change
      add_column :countries, :eliminated, :boolean, { default: false }
  end
end
