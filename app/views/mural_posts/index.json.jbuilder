json.array!(@mural_posts) do |mural_post|
  json.extract! mural_post, :id, :usuario_id, :from, :latitude, :longitude, :message, :posted_at
  json.url mural_post_url(mural_post, format: :json)
end
