class AddShootoutGoalsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :shootout_goals, :integer
  end
end
