json.array!(@debugs) do |debug|
  json.extract! debug, :id, :message
  json.url debug_url(debug, format: :json)
end
