json.extract! tracker, :id, :pet_id, :date, :feeding_time, :time_of_eat_back_and_forth, :food_type, :brand, :description, :amount, :left_amount, :favorite_score, :created_at, :updated_at
json.url tracker_url(tracker, format: :json)
