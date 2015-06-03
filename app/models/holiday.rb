class Holiday < ActiveRecord::Base
	include HTTParty
	
	has_many :holiday_date
	has_many :calender_date, through: :holiday_date

	def self.get_holidays_json
		h = JSON.parse(HTTParty.get('http://holidayapi.com/v1/holidays?country=US&year=2015').body)["holidays"]

		h.each do |date, info|
			Holiday.where(name: info["name"]).first_or_create
		end

	end
end
