class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :match, index: true
      t.references :country, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
