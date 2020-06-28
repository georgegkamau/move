class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :street_address, null: false, default: ""
      t.string :apt
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.integer :zip_code, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
