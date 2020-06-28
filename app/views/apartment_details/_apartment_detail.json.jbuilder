json.extract! apartment_detail, :id, :housing_type, :rent, :deposit, :bedrooms, :bathrooms, :available, :sq_foot, :description, :washer_dryer, :laundry, :pets, :street_parking, :parking, :dishwasher, :central_air, :swimming_pool, :gym, :user_id, :apartment_id, :created_at, :updated_at
json.url apartment_detail_url(apartment_detail, format: :json)
