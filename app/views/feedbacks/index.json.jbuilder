json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :name, :message, :suggestion
  json.url feedback_url(feedback, format: :json)
end
