json.array!(@registration_steps) do |registration_step|
  json.extract! registration_step, :id, :position, :name, :icon, :url
  json.url registration_step_url(registration_step, format: :json)
end
