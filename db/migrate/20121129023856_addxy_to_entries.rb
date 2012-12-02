class AddxyToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :x, :integer
    add_column :entries, :y, :integer
  end

  def down
    remove_column :entries, :x
    remove_column :entries, :y
  end
end
