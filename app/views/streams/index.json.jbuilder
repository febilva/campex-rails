json.array!(@board_streams) do |board_stream|
  json.extract! board_stream, :id, :name
  json.url board_stream_url(board_stream, format: :json)
end
