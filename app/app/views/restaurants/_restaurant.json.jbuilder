json.extract! restaurant, :id, :nombre, :correo, :direccion, :valoracion, :imagen, :numero_telefonico, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
