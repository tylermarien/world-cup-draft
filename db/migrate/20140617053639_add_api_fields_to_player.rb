class AddApiFieldsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :api_id, :string
    add_column :players, :image, :string
    add_column :players, :goals, :integer
    add_column :players, :own_goals, :integer
    add_column :players, :penalty_goals, :integer
  end
end
