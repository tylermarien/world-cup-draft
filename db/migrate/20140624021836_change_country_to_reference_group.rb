class ChangeCountryToReferenceGroup < ActiveRecord::Migration
  def change
    remove_column :countries, :group, :string
    add_reference :countries, :group, index: true
  end
end
