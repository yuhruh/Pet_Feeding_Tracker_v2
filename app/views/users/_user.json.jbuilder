json.extract! user, :id, :name, :email, :password_digest, :time_zone, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
