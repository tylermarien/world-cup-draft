class AddHandicapToCountries < ActiveRecord::Migration
  def change
      add_column :countries, :handicap, :int, { default: 0 }
  end
end
