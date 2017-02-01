json.extract! event, :id, :place, :time, :description, :created_at, :updated_at
json.url event_url(event, format: :json)