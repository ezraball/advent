class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :calendar_id
      t.integer :song_id
      t.integer :picture_id
      t.integer :movie_id
      t.date :unlock_date

      t.timestamps
    end
    add_index :entries, :calendar_id
    add_index :entries, :song_id
    add_index :entries, :picture_id
    add_index :entries, :movie_id
  end
end
