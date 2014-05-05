json.array!(@mural_posts) do |mural_post|
  json.extract! mural_post, :id, :user_id, :latitude, :longitude, :message
  json.url mural_post_url(mural_post, format: :json)
end
