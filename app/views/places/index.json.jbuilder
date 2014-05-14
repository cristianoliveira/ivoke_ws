json.array!(@places) do |place|
  json.extract! place, :id, :latitude, :longitude, :name, :description, :adress, :phone, :url_profile_img
  json.url place_url(place, format: :json)
end
