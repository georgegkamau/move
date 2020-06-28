json.extract! apartment, :id, :street, :apt, :city, :state, :zip_code, :user_id, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
