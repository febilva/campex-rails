json.array!(@stream_stream_subjects) do |stream_stream_subject|
  json.extract! stream_stream_subject, :id, :name, :part, :max_marks
  json.url stream_stream_subject_url(stream_stream_subject, format: :json)
end
