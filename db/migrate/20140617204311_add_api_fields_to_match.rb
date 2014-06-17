class AddApiFieldsToMatch < ActiveRecord::Migration
  def change
    remove_column :matches, :played, :boolean
    add_column :matches, :api_id, :string
    add_column :matches, :home_score, :integer
    add_column :matches, :away_score, :integer
    add_column :matches, :status, :string
  end
end
