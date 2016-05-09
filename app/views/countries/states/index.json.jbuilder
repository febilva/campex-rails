json.array!(@country_states) do |country_state|
  json.extract! country_state, :id, :name, :code
  json.url country_state_url(country_state, format: :json)
end
