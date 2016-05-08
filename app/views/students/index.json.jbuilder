json.array!(@students) do |student|
  json.extract! student, :id, :email, :name, :gender
  json.url student_url(student, format: :json)
end
