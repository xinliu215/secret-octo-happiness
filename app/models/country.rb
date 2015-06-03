class Country < ActiveRecord::Base
	has_many :holiday_date
	has_many :holidays, :through => :holiday_date
end
