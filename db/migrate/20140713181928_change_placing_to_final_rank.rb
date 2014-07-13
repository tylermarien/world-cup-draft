class ChangePlacingToFinalRank < ActiveRecord::Migration
  def change
    rename_column :countries, :placing, :final_rank
  end
end
