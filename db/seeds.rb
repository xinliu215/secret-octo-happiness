# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Holiday.delete_all
#CalenderDate.delete_all
#HolidayDate.delete_all
#Country.delete_all

begin_year = Date.today.beginning_of_year.year
end_year = begin_year + 30
countries_arr = ["BE", "US", "BR", "GB", "NO"]

####
countries_arr.each do |ct|
	Country.where(country: ct).first_or_create
end

####
puts "Start loading calender_dates table"
i = Date.today.beginning_of_year
while (i.year <= end_year) do 
	CalenderDate.where(calender_date: i).first_or_create
	i = i + 1.days
end
puts "Finished calender_dates table"

####
Country.all.each do |ct|
  (begin_year..end_year).each do |yr|
  	#####
	puts "Start loading holidays table in #{ct.country} #{yr}"
	h = JSON.parse(HTTParty.get("http://holidayapi.com/v1/holidays?country=#{ct.country}&year=#{yr}").body)["holidays"]

	h.each do |date, infos|
		infos.each do |info|
			Holiday.where(name: info["name"]).first_or_create
		end
	end
	puts "Finished holidays table in #{ct.country} #{yr}"

	#####
	puts "Start loading holiday_dates table in #{ct.country} #{yr}"
	h.each do |date, infos|
		cd = CalenderDate.find_by(calender_date: date.to_date)
		infos.each do |info|
			hl = Holiday.find_by(name: info["name"])
			HolidayDate.where(calender_date_id: cd.id, holiday_id: hl.id, country_id: ct.id).first_or_create
		end
	end
	puts "Finished holiday_dates table in #{ct.country} #{yr}"
  end
end



