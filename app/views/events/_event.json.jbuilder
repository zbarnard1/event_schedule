json.extract! event, :id, :start_time, :end_time, :name, :track_id, :created_at, :updated_at
json.url event_url(event, format: :json)
