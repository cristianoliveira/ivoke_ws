json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :user_id, :user_id, :time, :status
  json.url conversation_url(conversation, format: :json)
end
