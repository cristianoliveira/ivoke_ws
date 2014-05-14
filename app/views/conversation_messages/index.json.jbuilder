json.array!(@conversation_messages) do |conversation_message|
  json.extract! conversation_message, :id, :conversation_id, :user_id, :message, :time, :status
  json.url conversation_message_url(conversation_message, format: :json)
end
