json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome, :facebook_id
  json.url usuario_url(usuario, format: :json)
end
