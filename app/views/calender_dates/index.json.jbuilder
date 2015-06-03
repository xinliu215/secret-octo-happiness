json.array!(@calender_dates) do |calender_date|
  json.extract! calender_date, :id
  json.url calender_date_url(calender_date, format: :json)
end
