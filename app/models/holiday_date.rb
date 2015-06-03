class HolidayDate < ActiveRecord::Base
	include HTTParty
	belongs_to :calender_dates
	belongs_to :holidays
	belongs_to :countries
	has_many :calender_dates
	has_many :holidays
	has_many :countries

	

	def self.new_holiday_date
		h = JSON.parse(HTTParty.get('http://holidayapi.com/v1/holidays?country=US&year=2015').body)["holidays"]

		h.each do |date, infos|
		  cd = CalenderDate.find_by(calender_date: date.to_date)
		  infos.each do |info|
		    hl = Holiday.find_by(name: info["name"])
		    HolidayDate.create(calender_date_id: cd.id, holidays_id: hl_id)
		   end
		end
 	end	

end
