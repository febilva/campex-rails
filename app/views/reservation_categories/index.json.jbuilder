json.array!(@reservation_categories) do |reservation_category|
  json.extract! reservation_category, :id, :name
  json.url reservation_category_url(reservation_category, format: :json)
end
