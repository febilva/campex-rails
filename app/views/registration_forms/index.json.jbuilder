json.array!(@registration_forms) do |registration_form|
  json.extract! registration_form, :id, :student_id, :current_step, :instructions_read
  json.url registration_form_url(registration_form, format: :json)
end
