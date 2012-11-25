class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.date :pub_date

      t.timestamps
    end
  end
end
