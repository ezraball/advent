class AddStuffToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :end_date, :date
    add_column :calendars, :days_to_count_down, :integer
  end
end
