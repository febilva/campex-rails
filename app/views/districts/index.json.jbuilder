json.array!(@state_districts) do |state_district|
  json.extract! state_district, :id, :name, :code
  json.url state_district_url(state_district, format: :json)
end
