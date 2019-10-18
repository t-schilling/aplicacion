json.extract! orden, :id, :plato, :precio, :pago, :direccion, :llegada, :estado, :info, :created_at, :updated_at
json.url orden_url(orden, format: :json)
