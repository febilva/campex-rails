json.array!(@boards) do |board|
  json.extract! board, :id, :name, :subject_structure, :disabled
  json.url board_url(board, format: :json)
end
