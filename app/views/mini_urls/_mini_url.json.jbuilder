json.extract! mini_url, :id, :short_url, :full_url, :created_at, :updated_at
json.url mini_url_url(mini_url, format: :json)
