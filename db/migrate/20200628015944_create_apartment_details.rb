class CreateApartmentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :apartment_details do |t|
      t.string :housing_type 
      t.integer :rent 
      t.integer :deposit
      t.integer :bedrooms
      t.integer :bathrooms
      t.date :available
      t.boolean :pets
      t.text :description
      t.integer :sq_foot
      t.boolean :washer_dryer
      t.boolean :laundry 
      t.boolean :street_parking
      t.boolean :parking
      t.boolean :dishwasher
      t.boolean :central_air
      t.boolean :swimming_pool
      t.boolean :gym 
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
