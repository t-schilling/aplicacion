json.extract! plato, :id, :nombre, :precio, :descripcion, :cantidad_personas, :imagen, :valoracion, :created_at, :updated_at
json.url plato_url(plato, format: :json)
