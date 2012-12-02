class RemoveUnlockDateFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :unlock_date
    add_column :entries, :day, :integer
  end

  def down
    add_column :entries, :unlock_date, :date
    remove_column :entries, :day
  end
end
