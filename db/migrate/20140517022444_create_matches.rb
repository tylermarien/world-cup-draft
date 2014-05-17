class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :occurs_at
      t.belongs_to :home, index: true
      t.belongs_to :away, index: true

      t.timestamps
    end
  end
end
