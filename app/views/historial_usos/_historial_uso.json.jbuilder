json.extract! historial_uso, :id, :monto, :fechaInicio, :fechaFinal, :cantHoras, :user_id, :auto_id, :created_at, :updated_at
json.url historial_uso_url(historial_uso, format: :json)
