json.array!(@reservation_category_castes) do |reservation_category_caste|
  json.extract! reservation_category_caste, :id, :name
  json.url reservation_category_caste_url(reservation_category_caste, format: :json)
end
