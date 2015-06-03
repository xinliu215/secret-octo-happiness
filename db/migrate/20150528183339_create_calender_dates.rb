class CreateCalenderDates < ActiveRecord::Migration
  def change
    create_table :calender_dates do |t|
      t.date :calender_date
      t.timestamps null: false
    end
  end
end
