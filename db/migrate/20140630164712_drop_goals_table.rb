class DropGoalsTable < ActiveRecord::Migration
  def up
    drop_table :goals
  end

  def down
    create_table :goals do |t|
      t.references :match, index: true
      t.references :country, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
