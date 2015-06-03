class CreateHolidayDates < ActiveRecord::Migration
  def change
    create_table :holiday_dates do |t|
      t.integer :holiday_id
      t.integer :calender_date_id
      t.timestamps null: false
    end
  end
end
