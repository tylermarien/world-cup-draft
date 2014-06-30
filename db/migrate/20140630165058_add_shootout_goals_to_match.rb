class AddShootoutGoalsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :home_shootout_score, :integer
    add_column :matches, :away_shootout_score, :integer
  end
end
