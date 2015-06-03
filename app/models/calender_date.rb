class CalenderDate < ActiveRecord::Base
	has_many :hoilday_date
	has_many :holidays, through: :holiday_date
	
end
